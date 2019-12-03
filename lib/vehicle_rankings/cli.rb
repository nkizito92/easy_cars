# CLI controller 
class VehicleRankings::CLI
  def call 
    puts "HI what is up"
    list_models
    models
    close
  end 
  
  # desired settup for list of vehicles 
  def list_models
     @ranks = VehicleRankings::Ranks
  end 
  
  def models
    puts "Enter the number for the vehicle model or type list to see list of models or type exit to quit"
    
     input = nil
    while input != "exit"
      input = gets.strip.downcase 
      case input
      when "1"
        puts "You selected SUV"
      when "2"
        puts "You selected Sedan"
      when "3"
        puts "You selected Couple"
      when "4"
        puts "You selected Van"
      when "5"
        puts "You selected Truck"
      when "list"
        list_models
      when "exit" 
      else
        # change between 1 to 5 to (1 through list_models) 
        puts "Invaild please type list, exit, or between 1, 5"
      end 
    end  
  end 
  def close 
     puts "closing search!!"
  end  

end 