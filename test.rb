require_relative 'lib/ergast'

ergast = Ergast.new

puts ergast.race_results round: :last, season: :current
