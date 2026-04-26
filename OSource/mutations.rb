def adaptation_vortex
  ## Create new sound_file with new ruleset permutation.
  ruleset_choice = File.read("_rulesets/choice/value.txt").to_s.to_i

  # Resets reset choice if at 8 in Ruby.
  if ruleset_choice > 8
    ruleset_choice = 0
  end

  mutation1 = File.read_lines("_adaptation/ruleset_shift1.txt")
  mutation2 = File.read_lines("_adaptation/ruleset_shift2.txt")
  mutation3 = File.read_lines("_adaptation/ruleset_shift3.txt")
  mutation4 = File.read_lines("_adaptation/ruleset_shift4.txt")
  mutation5 = File.read_lines("_adaptation/ruleset_shift5.txt")
  mutation6 = File.read_lines("_adaptation/ruleset_shift6.txt")
  mutation7 = File.read_lines("_adaptation/ruleset_shift7.txt")
  mutation8 = File.read_lines("_adaptation/ruleset_shift8.txt")
  mutation9 = File.read_lines("_adaptation/ruleset_shift9.txt")

  ruleset_list = [
    mutation1, mutation2, mutation3,
    mutation4, mutation5, mutation6,
    mutation7, mutation8, mutation9,
  ]

  chosen_ruleset = ruleset_list[ruleset_choice]

  ## These are the rows.
  vortex_row_1 = 0
  vortex_row_2 = 1
  vortex_row_4 = 3
  vortex_row_8 = 7
  vortex_row_7 = 6
  vortex_row_5 = 4

  ## Performs standard subroutines.
  system("#{chosen_ruleset[vortex_row_1]}")
  system("#{chosen_ruleset[vortex_row_2]}")
  system("#{chosen_ruleset[vortex_row_4]}")
  system("#{chosen_ruleset[vortex_row_8]}")
  system("#{chosen_ruleset[vortex_row_7]}")
  system("#{chosen_ruleset[vortex_row_5]}")
  system("#{chosen_ruleset[vortex_row_1]}")

  open("_rulesets/choice/value.txt", "w") { |f|
    ruleset_choice = ruleset_choice + 1

    f.puts ruleset_choice
  }
end

adaptation_vortex
