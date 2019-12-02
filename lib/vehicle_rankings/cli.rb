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
      puts <<-Doc.gsub /^\s*/, '' 
         1. SUV
         2. Sedan 
         3. Couple 
         4. Van
         5. Truck
        Doc
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
          end 
          
     end 
   def close 
     puts "closing search!!"
   end 
  end 
  
  
end 