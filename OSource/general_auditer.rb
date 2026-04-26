class EvaluationRules
  class ColorSpecification
    def self.sore_float(condition)
      if condition
        if yield and yield.is_a?(Float)
          return true
        else
          return "Error: Sore_float is not a Float."
        end
      end

      false
    end

    def self.shikashi_float(already_done, condition)
      return true if already_done

      if condition
        if yield and yield.is_a?(Float)
          return true
        else
          return "Error: Shikashi_float is not a Float."
        end
      end
    end

    def self.matawa_float(already_done)
      value = yield unless already_done

      if value and value.is_a?(Float)
        return true
      else
        return "Error: Shikashi_float is not a Float."
      end

      unless already_done
        if defined?(otherwise)
          puts otherwise

          #puts "#{$otherwise_not[0]} is 'THAT'"
          #puts "#{$otherwise_not[1]} is 'WHAT'"
        end
      else
        puts "Otherwise is not defined."
      end
    end

    ## Color Specification
    def self.color_specification(value, name)
      case value
      when  0.004..0.320; puts "#{name}: This color is subtracted from your current canvas."
      when  0.321..0.500; puts "#{name}: This color is barely present on your canvas."
      when  0.501..0.750; puts "#{name}: This color is vibrant on your canvas."
      when  0.751..1.000; puts "#{name}: There is way to much of this color on your canvas."
      else
        puts "#{name}: Color is to bright or dark to properly determine."
      end
    end

    def self.wave(ebb_tide, flow_tide, tidal_current, flood_current, tidal_level, screen_x, screen_y, probability)
      current_ebb     =      ebb_tide
      current_flow    =     flow_tide
      current_current = tidal_current
      current_flood   = flood_current
      current_level   =   tidal_level
  
      ebb_x = ( screen_x - ( current_ebb * ( 1 / probability ) ) ).round
      ebb_y = ( screen_y - ( current_ebb * ( 1 / probability ) ) ).round
  
      flow_x = ( screen_x - ( current_flow * ( 1 / probability ) ) ).round
      flow_y = ( screen_y - ( current_flow * ( 1 / probability ) ) ).round
  
      current_x = ( screen_x - ( current_current * ( 1 / probability ) ) ).round
      current_y = ( screen_y - ( current_current * ( 1 / probability ) ) ).round
  
      flood_x = ( screen_x - ( current_flood * ( 1 / probability ) ) ).round
      flood_y = ( screen_y - ( current_flood * ( 1 / probability ) ) ).round
  
      level_x = ( screen_x - ( current_level * ( 1 / probability ) ) ).round
      level_y = ( screen_y - ( current_level * ( 1 / probability ) ) ).round
  
      #puts "Ebb: #{ebb_x} #{ebb_y}"
      #puts "Flow: #{flow_x} #{flow_y}"
      #puts "Current: #{current_x} #{current_y}"
      #puts "Flood: #{flood_x} #{flood_y}"
      #puts "Level: #{level_x} #{level_y}"

      "Ebb: #{current_ebb} Flow: #{current_flow} Current: #{current_current} Flood: #{current_flood} Level: #{current_level}"
    end

    def self.generate_coordinates
      possible_coordinates = [
        [[360, 360, 360, 360, 360, 360, 360, 360],
         [360, 360, 360, 360, 360, 360, 360, 315],
         [360, 360, 360, 360, 360, 360, 360, 270],
         [360, 360, 360, 360, 360, 360, 360, 225],
         [360, 360, 360, 360, 360, 360, 360, 180],
         [360, 360, 360, 360, 360, 360, 360, 135],
         [360, 360, 360, 360, 360, 360, 360,  90],
         [360, 360, 360, 360, 360, 360, 360,  45]],

        [[315, 315, 315, 315, 315, 315, 315, 360],
         [315, 315, 315, 315, 315, 315, 315, 315],
         [315, 315, 315, 315, 315, 315, 315, 270],
         [315, 315, 315, 315, 315, 315, 315, 225],
         [315, 315, 315, 315, 315, 315, 315, 180],
         [315, 315, 315, 315, 315, 315, 315, 135],
         [315, 315, 315, 315, 315, 315, 315,  90],
         [315, 315, 315, 315, 315, 315, 315,  45]],

        [[270, 270, 270, 270, 270, 270, 270, 360],
         [270, 270, 270, 270, 270, 270, 270, 315],
         [270, 270, 270, 270, 270, 270, 270, 270],
         [270, 270, 270, 270, 270, 270, 270, 225],
         [270, 270, 270, 270, 270, 270, 270, 180],
         [270, 270, 270, 270, 270, 270, 270, 135],
         [270, 270, 270, 270, 270, 270, 270,  90],
         [270, 270, 270, 270, 270, 270, 270,  45]],

        [[225, 225, 225, 225, 225, 225, 225, 360],
         [225, 225, 225, 225, 225, 225, 225, 315],
         [225, 225, 225, 225, 225, 225, 225, 270],
         [225, 225, 225, 225, 225, 225, 225, 225],
         [225, 225, 225, 225, 225, 225, 225, 180],
         [225, 225, 225, 225, 225, 225, 225, 135],
         [225, 225, 225, 225, 225, 225, 225,  90],
         [225, 225, 225, 225, 225, 225, 225,  45]],

        [[180, 180, 180, 180, 180, 180, 180, 360],
         [180, 180, 180, 180, 180, 180, 180, 315],
         [180, 180, 180, 180, 180, 180, 180, 270],
         [180, 180, 180, 180, 180, 180, 180, 225],
         [180, 180, 180, 180, 180, 180, 180, 180],
         [180, 180, 180, 180, 180, 180, 180, 135],
         [180, 180, 180, 180, 180, 180, 180,  90],
         [180, 180, 180, 180, 180, 180, 180,  45]],

        [[135, 135, 135, 135, 135, 135, 135, 360],
         [135, 135, 135, 135, 135, 135, 135, 315],
         [135, 135, 135, 135, 135, 135, 135, 270],
         [135, 135, 135, 135, 135, 135, 135, 225],
         [135, 135, 135, 135, 135, 135, 135, 180],
         [135, 135, 135, 135, 135, 135, 135, 135],
         [135, 135, 135, 135, 135, 135, 135,  90],
         [135, 135, 135, 135, 135, 135, 135,  45]],

        [[90, 90, 90, 90, 90, 90, 90, 360],
         [90, 90, 90, 90, 90, 90, 90, 315],
         [90, 90, 90, 90, 90, 90, 90, 270],
         [90, 90, 90, 90, 90, 90, 90, 225],
         [90, 90, 90, 90, 90, 90, 90, 180],
         [90, 90, 90, 90, 90, 90, 90, 135],
         [90, 90, 90, 90, 90, 90, 90,  90],
         [90, 90, 90, 90, 90, 90, 90,  45]],

        [[45, 45, 45, 45, 45, 45, 45, 360],
         [45, 45, 45, 45, 45, 45, 45, 315],
         [45, 45, 45, 45, 45, 45, 45, 270],
         [45, 45, 45, 45, 45, 45, 45, 225],
         [45, 45, 45, 45, 45, 45, 45, 180],
         [45, 45, 45, 45, 45, 45, 45, 135],
         [45, 45, 45, 45, 45, 45, 45,  90],
         [45, 45, 45, 45, 45, 45, 45,  45]],
      ]
 
      row_options = [0, 1, 2, 3, 4, 5, 6, 7]
      col_options = [0, 1, 2, 3, 4, 5, 6, 7]
      arr_options = [0, 1, 2, 3, 4, 5, 6, 7]
      
      cur_row = row_options.sample
      cur_col = col_options.sample
      cur_arr = arr_options.sample
  
      current_coordinate = possible_coordinates[cur_row][cur_col][cur_arr]
 
      current_coordinate
    end
    
    def self.estimate(upper_boundary, lower_boundary, probability, room_x, room_y)
      evaluate = sore_float(upper_boundary > 0.8) do
        # This specifies a specific color intensity.
        EvaluationRules::ColorSpecification.color_specification(probability, "Vert")

        # This specifies a wave distribution
        EvaluationRules::ColorSpecification.wave(generate_coordinates,
                                                 EvaluationRules::ColorSpecification.generate_coordinates,
                                                 EvaluationRules::ColorSpecification.generate_coordinates,
                                                 EvaluationRules::ColorSpecification.generate_coordinates,
                                                 7, room_x, room_y, probability)
      end
  
      evaluate = shikashi_float(evaluate, upper_boundary > 0.2) do
        # This specifies a specific color intensity.
        EvaluationRules::ColorSpecification.color_specification(probability, "Rouge")

        # This specifies a wave distribution
        EvaluationRules::ColorSpecification.wave(generate_coordinates,
                                                 EvaluationRules::ColorSpecification.generate_coordinates,
                                                 EvaluationRules::ColorSpecification.generate_coordinates,
                                                 EvaluationRules::ColorSpecification.generate_coordinates,
                                                 7, room_x, room_y, probability)
      end
  
      evaluate = matawa_float(evaluate) do
        su == "success"
        sk == "sketchy"
        fa == "failure"
    
        results = [
          [[su, su, su],
           [su, su, sk],
           [su, su, fa]],

          [[sk, sk, su],
           [sk, sk, sk],
           [sk, sk, fa]],

          [[fa, fa, su],
           [fa, fa, sk],
           [fa, fa, fa]],
        ]
    
        row_options = [0, 1, 2]
        col_options = [0, 1, 2]
        arr_options = [0, 1, 2]
    
        cur_row = row_options.sample
        cur_col = col_options.sample
        cur_arr = arr_options.sample
    
        current_outcome = results[cur_row][cur_col][cur_arr]
    
        if    current_outcome == su; puts "It was a success."
          # This specifies a specific color intensity.
          EvaluationRules::ColorSpecification.color_specification(probability, "Vert")

          # This specifies a wave distribution
          EvaluationRules::ColorSpecification.wave(generate_coordinates, generate_coordinates, generate_coordinates, generate_coordinates, 7, room_x, room_y, probability)
        elsif current_outcome == sk; puts "That was kind of sketchy."
          # This specifies a specific color intensity.
          EvaluationRules::ColorSpecification.color_specification(probability, "Jaune")

          # This specifies a wave distribution
          EvaluationRules::ColorSpecification.wave(generate_coordinates, generate_coordinates, generate_coordinates, generate_coordinates, 7, room_x, room_y, probability)
        elsif current_outcome == fa; puts "I was not successful."
          # This specifies a specific color intensity.
          EvaluationRules::ColorSpecification.color_specification(probability, "Rouge")

          # This specifies a wave distribution
          EvaluationRules::ColorSpecification.wave(generate_coordinates, generate_coordinates, generate_coordinates, generate_coordinates, 7, room_x, room_y, probability)
        else
          puts "I'm not sure what's going on here."
        end
      end
    end
  end
end

def santiago_lite(b1, b2, b3, b4,
                  c1, c2, c3, c4,
                  d1, d2, d3, d4,
                  f1, f2, f3, f4,
                  g1, g2, g3, g4,
                  h1, h2, h3, h4,
                  a1, a2, a3, a4,
                  e1, e2, e3, e4,
                  i1, i2, i3, i4,
                  o1, o2, o3, o4,
                  u1, u2, u3, u4)

  b = [ b1, b2, b3, b4 ]
  c = [ c1, c2, c3, c4 ]
  d = [ d1, d2, d3, d4 ]
  f = [ f1, f2, f3, f4 ]
  g = [ g1, g2, g3, g4 ]
  h = [ h1, h2, h3, h4 ]
  a = [ a1, a2, a3, a4 ]
  e = [ e1, e2, e3, e4 ]
  i = [ i1, i2, i3, i4 ]
  o = [ o1, o2, o3, o4 ]
  u = [ u1, u2, u3, u4 ]

  symbols = [[
    [b[0], a[0]], [b[0], u[0]], [c[0], o[0]],
    [d[0], i[0]], [f[0], e[0]], [b[0], e[0]],     
    [b[0], o[0]], [c[0], a[0]], [c[0], i[0]],
  ], [
    [c[0], u[0]], [d[0], e[0]], [d[0], o[0]],
    [f[0], a[0]], [f[0], i[0]], [f[0], u[0]],
    [b[0], i[0]], [c[0], e[0]], [d[0], a[0]],
  ], [
    [d[0], u[0]], [f[0], o[0]], [g[0], a[0]],
    [g[0], u[0]], [g[0], e[0]], [g[0], o[0]],
    [g[0], i[0]], [h[0], a[0]], [h[0], e[0]],
  ]]

  argument_one = [[
    [b[1], a[1]], [b[1], u[1]], [c[1], o[1]],
    [d[1], i[1]], [f[1], e[1]], [b[1], e[1]],
    [b[1], o[1]], [c[1], a[1]], [c[1], i[1]],
  ], [
    [c[1], u[1]], [d[1], e[1]], [d[1], o[1]],
    [f[1], a[1]], [f[1], i[1]], [f[1], u[1]],
    [b[1], i[1]], [c[1], e[1]], [d[1], a[1]],
  ], [
    [d[1], u[1]], [f[1], o[1]], [g[1], a[1]],
    [g[1], u[1]], [g[1], e[1]], [g[1], o[1]],
    [g[1], i[1]], [h[1], a[1]], [h[1], e[1]],
  ]]

  argument_two = [[
    [b[2], a[2]], [b[2], u[2]], [c[2], o[2]],
    [d[2], i[2]], [f[2], e[2]], [b[2], e[2]],
    [b[2], o[2]], [c[2], a[2]], [c[2], i[2]],
  ], [
    [c[2], u[2]], [d[2], e[2]], [d[2], o[2]],
    [f[2], a[2]], [f[2], i[2]], [f[2], u[2]],
    [b[2], i[2]], [c[2], e[2]], [d[2], a[2]],
  ], [
    [d[2], u[2]], [f[2], o[2]], [g[2], a[2]],
    [g[2], u[2]], [g[2], e[2]], [g[2], o[2]],
    [g[2], i[2]], [h[2], a[2]], [h[2], e[2]],
  ]]

  argument_tre = [[
    [b[3], a[3]], [b[3], u[3]], [c[3], o[3]],
    [d[3], i[3]], [f[3], e[3]], [b[3], e[3]],
    [b[3], o[3]], [c[3], a[3]], [c[3], i[3]],
  ], [
    [c[3], u[3]], [d[3], e[3]], [d[3], o[3]],
    [f[3], a[3]], [f[3], i[3]], [f[3], u[3]],
    [b[3], i[3]], [c[3], e[3]], [d[3], a[3]],
  ], [
    [d[3], u[3]], [f[3], o[3]], [g[3], a[3]],
    [g[3], u[3]], [g[3], e[3]], [g[3], o[3]],
    [g[3], i[3]], [h[3], a[3]], [h[3], e[3]],
  ]]

  probability = [[
    [0.50, 0.50], [0.50, 0.50], [0.50, 0.50],
    [0.50, 0.50], [0.50, 0.50], [0.50, 0.50],
    [0.50, 0.50], [0.50, 0.50], [0.50, 0.50],
  ], [
    [0.50, 0.50], [0.50, 0.50], [0.50, 0.50],
    [0.50, 0.50], [0.50, 0.50], [0.50, 0.50],
    [0.50, 0.50], [0.50, 0.50], [0.50, 0.50],
  ], [
    [0.50, 0.50], [0.50, 0.50], [0.50, 0.50],
    [0.50, 0.50], [0.50, 0.50], [0.50, 0.50],
    [0.50, 0.50], [0.50, 0.50], [0.50, 0.50],
  ]]

  base_probability = 0.33 * 0.33
  
  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  ## Current Symbol
  current_symbol = symbols[cur_row][cur_col][cur_arr]
  
  ## Current Argument One
  current_arg1 = argument_one[cur_row][cur_col][cur_arr]

  ## Current Argument Two
  current_arg2 = argument_two[cur_row][cur_col][cur_arr]
  
  ## Current Argument Tre
  current_arg3 = argument_tre[cur_row][cur_col][cur_arr]
  
  ## Current Probabbility
  probability_selection = probability[cur_row][cur_col][cur_arr]
  current_probability   = base_probability * 0.5
  
  current_information = "#{current_symbol}, '#{current_arg1}', '#{current_arg2}', '#{current_arg3}'"
  
  puts current_information

  File.write("data/statistics/probability/current_probability.txt", "#{current_probability}")
  File.write("data/statistics/label/current_information.txt",            current_information)

  #$current_symbol      = current_symbol
  #$current_arg1        = current_arg1
  #$current_arg2        = current_arg2
  #$current_arg3        = current_arg3
  #$current_probability = current_probability
  #$current_information = current_information
end

def gain
  current_probability = File.read("data/statistics/probability/current_probability.txt").to_f
  current_information = File.read("data/statistics/label/current_information.txt")

  if current_probability > 0.999999999999999999
    current_probability = 0.9 / current_probability
  end
  
  case current_probability
  when 0.003921569000000000..0.287225000000000000
    puts "I'm confident it is not [ #{current_information} ] as its only #{current_probability}."
  when 0.287225000000000001..0.522225000000000000
    puts "I'm less unconfident it is not [ #{current_information} ] as its only #{current_probability}."
  when 0.522225000000000001..0.756112500000000000
    puts "I'm almost sure it is [ #{current_information} ] because it has #{current_probability}."
  when 0.756112500000000001..0.999999999999999999
    puts "I'm sure it is [ #{current_information} ] after all it has #{current_probability}."

  else
    puts "The probability is either to low or to large, so I can't determine exactly."
  end
  
  current_probability    = current_probability + current_probability
  
  File.write("data/statistics/probability/current_probability.txt", "#{current_probability}")
  File.write("data/statistics/label/current_information.txt",       current_information)
end

def loss
  current_probability = File.read("data/statistics/probability/current_probability.txt").to_f
  current_information = File.read("data/statistics/label/current_information.txt")

  if current_probability > 0.999999999999999999
    current_probability = 0.9 / current_probability
  end
  
  case current_probability
  when 0.003921569000000000..0.287225000000000000
    puts "I'm confident it is not [ #{current_information} ] as its only #{current_probability}."
  when 0.287225000000000001..0.522225000000000000
    puts "I'm less unconfident it is not [ #{current_information} ] as its only #{current_probability}."
  when 0.522225000000000001..0.756112500000000000
    puts "I'm almost sure it is [ #{current_information} ] because it has #{current_probability}."
  when 0.756112500000000001..0.999999999999999999
    puts "I'm sure it is [ #{current_information} ] after all it has #{current_probability}."

  else
    puts "The probability is either to low or to large, so I can't determine exactly."
  end
  
  current_probability    = current_probability + current_probability
  
  File.write("data/statistics/probability/current_probability.txt", "#{current_probability}")
  File.write("data/statistics/label/current_information.txt",       current_information)
end

def sl_reward_allocation
  l1_reasses = "level one reasses"
  l2_reasses = "level two reasses"
  l3_reasses = "level tre reasses"
  l4_reasses = "level fro reasses"

  reward_model = [
    [[l1_reasses, l1_reasses, l1_reasses, l1_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l2_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l3_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l4_reasses]],
   
    [[l2_reasses, l2_reasses, l2_reasses, l1_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l2_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l3_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l4_reasses]],
   
    [[l3_reasses, l3_reasses, l3_reasses, l1_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l2_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l3_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l4_reasses]],
   
    [[l4_reasses, l4_reasses, l4_reasses, l1_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l2_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l3_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l4_reasses]],
  ]

  row_options = [0, 1, 2, 3]
  col_options = [0, 1, 2, 3]
  arr_options = [0, 1, 2, 3]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_reward_structure = reward_model[cur_row][cur_col][cur_arr]

  if    current_reward_structure == l1_reasses; gain
  elsif current_reward_structure == l2_reasses; 2.times do gain end
  elsif current_reward_structure == l3_reasses; 3.times do gain end
  elsif current_reward_structure == l4_reasses; 4.times do gain end
  else
    gain
  end
end

def sl_loss_allocation
  l1_reasses = "level one reasses"
  l2_reasses = "level two reasses"
  l3_reasses = "level tre reasses"
  l4_reasses = "level fro reasses"

  reward_model = [
    [[l1_reasses, l1_reasses, l1_reasses, l1_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l2_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l3_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l4_reasses]],
   
    [[l2_reasses, l2_reasses, l2_reasses, l1_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l2_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l3_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l4_reasses]],
   
    [[l3_reasses, l3_reasses, l3_reasses, l1_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l2_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l3_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l4_reasses]],
   
    [[l4_reasses, l4_reasses, l4_reasses, l1_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l2_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l3_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l4_reasses]],
  ]

  row_options = [0, 1, 2, 3]
  col_options = [0, 1, 2, 3]
  arr_options = [0, 1, 2, 3]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_reward_structure = reward_model[cur_row][cur_col][cur_arr]

  if    current_reward_structure == l1_reasses; loss
  elsif current_reward_structure == l2_reasses; 2.times do loss end
  elsif current_reward_structure == l3_reasses; 3.times do loss end
  elsif current_reward_structure == l4_reasses; 4.times do loss end
  else
    loss
  end
end

def dynamic_mode_switcher
  modes = [
    [["deposit", "deposit"], ["deposit", "extract"]],
    [["extract", "deposit"], ["extract", "extract"]],
  ]
  
  row_options = [0, 1]
  col_options = [0, 1]
  arr_options = [0, 1]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_mode = modes[cur_row][cur_col][cur_arr]

  if    current_mode == "deposit"; sl_reward_allocation
  elsif current_mode == "extract"; sl_loss_allocation
  else
    sl_loss_allocation
  end
end

2.times do
  santiago_lite( ARGV[0],  ARGV[1],  ARGV[2],  ARGV[3],
                 ARGV[4],  ARGV[5],  ARGV[6],  ARGV[7],
                 ARGV[0],  ARGV[1],  ARGV[2],  ARGV[3],
                 ARGV[4],  ARGV[5],  ARGV[6],  ARGV[7],
                 ARGV[8],  ARGV[9], ARGV[10], ARGV[11],
                ARGV[12], ARGV[13], ARGV[14], ARGV[15],
                ARGV[16], ARGV[17], ARGV[18], ARGV[19],
                ARGV[20], ARGV[21], ARGV[22], ARGV[23],
                ARGV[24], ARGV[25], ARGV[26], ARGV[27],
                ARGV[28], ARGV[29], ARGV[30], ARGV[31],
                ARGV[32], ARGV[33], ARGV[34], ARGV[35])
                
  dynamic_mode_switcher    
end
