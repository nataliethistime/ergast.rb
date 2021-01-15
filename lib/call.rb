require 'net/http'
require 'json'

class Call
  VALID_SERIES = ['f1']
  VALID_SEASONS = [1950..Time.now.year, 'current']
  VALID_ROUNDS = [1..25, 'last', 'next']

  attr_reader :series, :season, :round, :subroutine

  def initialize(subroutine, series: 'f1', season: 'current', round: nil)
    self.series = series
    self.season = season
    self.round = round
    @subroutine = subroutine
  end

  def series=(new_val)
    new_val = new_val.to_s if new_val.is_a? Symbol
    raise ArgumentError, "Invalid series: #{new_val.inspect}" unless VALID_SERIES.include? new_val
    @series = new_val
  end

  def season=(new_val)
    new_val = new_val.to_s if new_val.is_a? Symbol
    raise ArgumentError, "Invalid season #{new_val.inspect}" unless VALID_SEASONS.include? new_val
    @season = new_val
  end

  def round=(new_val)
    new_val = new_val.to_s if new_val.is_a? Symbol
    raise ARgumentError, "Invalid round: #{new_val.inspect}" unless VALID_ROUNDS.include? new_val
  end

  def to_url
    components = [series, season, round, subroutine]
      .filter { |item| !!item }
      .join '/'
    "http://ergast.com/api/#{components}.json"
  end

  def fetch
    res = Net::HTTP.get(URI(self.to_url))
    JSON.parse(res)
  end
end
