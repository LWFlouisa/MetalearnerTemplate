require "./CetteStatistique/cette.cr"

a1, a2 = ARGV[0], ARGV[1]
b1, b2 = ARGV[2], ARGV[3]
c1, c2 = ARGV[4], ARGV[5]

#how_many = ARGV[5].to_i

#puts "__Une__"
#ParallelStatistics::Evobayesian.cette_statistique.call(a1, a2, b1, b2, c1, c2)

#puts "\n__Deux_"
#ParallelStatistics::Evobayesian.maisette_statistique.call(c1, c2, b1, b2, a1, a2)

#puts "\n__Trois__"
#ParallelStatistics::Evobayesian.sinon_statistique.call(b1, b2, c1, c2, a1, a2)

ParallelStatistics::Evobayesian.get_statistics(a1, a2, b1, b2, c1, c2)
                       
2.times do
  ParallelStatistics::Evobayesian.dynamic_reward_allocation
end

current_information_a = File.read("data/statistics/label/label_a/current_information.txt")
current_information_b = File.read("data/statistics/label/label_b/current_information.txt")
current_information_c = File.read("data/statistics/label/label_c/current_information.txt")

puts "Creating Cremains..."
ParallelStatistics::DataRecycling.obelisk(current_information_a)
ParallelStatistics::DataRecycling.obelisk(current_information_b)
ParallelStatistics::DataRecycling.obelisk(current_information_c)

puts "__Scattering Ashes__"
ParallelStatistics::DataRecycling.scatter_ashes
