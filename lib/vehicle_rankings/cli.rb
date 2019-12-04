# CLI controller 
class VehicleRankings::CLI
  def call 
    list_models
    models
    close
  end 
  
  # desired settup for list of vehicles 
  def list_models
     @models = VehicleRankings::Model.scrape_site
     @models.each.with_index(1) {|model, index| puts "#{index}. #{model.year} #{model.name} - #{model.price} #{model.rate} #{model.url}" } 
  end 
  
  def models
    puts "Enter the number for the vehicle model or type list to see list of models or type exit to quit"
    
     input = nil
    while input != "exit"
      input = gets.strip.downcase 
      case input 
        #  when "input" 
      when "1"
        # puts "you selected #{model.name}"
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
        puts " #{input} is invaild please type list, exit, or a number between 1, #{@models.length}"
      end 
    end  
  end 
  def close 
     puts "closing search!!"
  end  

end 