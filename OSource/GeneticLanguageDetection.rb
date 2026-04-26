require "./CetteStatistique/cette.cr"

a1, a2 = ":option_one", GeneticLanguageGenerator::Formal.create_formal
b1, b2 = ":option_two", GeneticLanguageGenerator::Formal.create_formal
c1, c2 = ":option_tre", GeneticLanguageGenerator::Formal.create_formal

ParallelStatistics::Evobayesian.get_statistics(a1, a2, b1, b2, c1, c2)

2.times do
  ParallelStatistics::Evobayesian.dynamic_mode_switcher
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
