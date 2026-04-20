ruby -e '
def make_determination
  require "SelfModifiedDecisionTree"

  current_probability = File.read("data/statistics/probability/current_probability.txt").to_f
  #current_information = File.read("data/statistics/label/current_information.txt")
  
  input = current_probability

  attributes = ["Object"], ["Subject"], ["Verb"]

  training = [
    [0.023902125,     "The object here is most likely a chair being transported from the entrance to the right escalator."],
    [0.298776562,  "The object here is most likely a package being transported from the entrance to the center escalator."],
    [0.701223438,   "The object here is most likely a package being transported from the entrance to the right escalator."],
  ], [
    [0.023902125,           "In this instance the subject in question is mein maisette, or your house."],
    [0.298776562, "In this instance the subject in question is tien maisette, or your intimates house."],
    [0.701223438,   "In this instance the subject in question is notre maisette, or a strangers house."],
  ], [
    [0.023902125,      "Here the action in question is transporting a chair."],
    [0.298776562, "Here the action in question is transporting is a package."],
    [0.701223438, "Here the action in question is transporting is a package."],
  ]
  
  dec_tree_configurations =    DecisionTree::ID3Tree.new(attributes[0], training[0], 1, :continuous),
                               DecisionTree::ID3Tree.new(attributes[1], training[1], 1, :continuous),
                               DecisionTree::ID3Tree.new(attributes[2], training[2], 1, :continuous)

  current_dectree1 = dec_tree_configurations[0]
  current_dectree1.train

  current_dectree2 = dec_tree_configurations[1]
  current_dectree2.train

  current_dectree3 = dec_tree_configurations[2]
  current_dectree3.train

  test1 = [input,  "The object here is most likely a package being transported from the entrance to the center escalator."]
  test2 = [input,                  "In this instance the subject in question is tien maisette, or your intimates house."]
  test3 = [input,                                              "Here the action in question is transporting is a package."]

  ## Sesne I got rid of decision trees data marshalling, I have to reassign last tests.
  last_first_decision  = test1[1]
  last_second_decision = test2[1]
  last_third_decision  = test3[1]

  decision1 = current_dectree1.predict(test1) # This being Alberts contribution
  decision2 = current_dectree2.predict(test2) # This being Andys contribution
  decision3 = current_dectree3.predict(test3) # This being Bethanys contribution
  
  puts "#{decision1} #{decision2} #{decision3}"
end

make_determination
'
