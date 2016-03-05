module Helpers
  def Helpers.die(message)
    puts "[ERROR] #{message}" if message
    exit
  end
end
