bonjour  = Proc(String, String).new { |bonjour|   bonjour }
ejento   = Proc(String, String).new { |ejento|     ejento }
rikusuto = Proc(String, String).new { |rikusuto| rikusuto }
atemu    = Proc(String, String).new { |atemu|       atemu }
nitotte  = Proc(String, String).new { |nitotte|   nitotte }
yuza     = Proc(String, String).new { |yuza|         yuza }
bot_name = Proc(String, String).new { |bot_name| bot_name }

demande_fait = Proc(String, String, String, String, String, String, String, Nil).new { |bonjour,  ejento, rikusuto, atemu, nitotte, yuza, bot_name |

  puts "#{bot_name}: #{bonjour} #{ejento}, #{rikusuto} #{atemu} #{nitotte} #{yuza}."
}

demande_fait.call( bonjour.call(ARGV[0]),
                      ejento.call(ARGV[1]),
                    rikusuto.call(ARGV[2]),
                       atemu.call(ARGV[3]),
                     nitotte.call(ARGV[4]),
                        yuza.call(ARGV[5]),
                    bot_name.call(ARGV[6]))
