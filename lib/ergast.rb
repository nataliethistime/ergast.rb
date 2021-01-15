require_relative 'call'

class Ergast
  def initialize
    @call_count = 0
  end

  def race_results(options)
    Call.new('results', **options).fetch
  end
end
