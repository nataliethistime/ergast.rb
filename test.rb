require_relative 'lib/ergast'

puts 'Latest driver standings for the current season'
puts Ergast.f1.current.last.results.go!

puts 'Results of the 2008 Turkish Grand Prix (round 5 of the championship)'
puts Ergast.f1[2008][5].results.go!
