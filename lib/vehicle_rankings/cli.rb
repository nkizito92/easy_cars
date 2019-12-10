# CLI controller 
class VehicleRankings::CLI 
  def call 
    Car.create
    list_cars
    models
    close
  end 
  
  # desired setup for list of vehicles 
  def list_cars
    Car.print_all
  end 

  def models
    # check the input if valid 
    puts "\nEnter the number to pick the desired vehicle or type 'exit' to quit"
    puts "\nTo see the cheapest car type 'cheap'."
     input = nil
    while input != "exit"
      input = gets.strip.downcase 
      if input == "list" || input == "no"
        list_cars
      elsif input == "cars" 
        Car.print_cars
      elsif input == "cheap"
         takes_input = 2
        Car.cheapest 
        puts "\nWould you like to see this cars details? Type 'yes' or 'no' to continue"
      elsif input == "exit"
        # do nothing
      elsif input.to_i > 0 && input.to_i <= Car.all.length
        takes_input = input.to_i
        user_input = Car.all[(takes_input)-1]
        puts "\nYou selected #{user_input.name}"
        puts "\nIt cost $#{user_input.price}"
        puts "\nWould you like to view this selected vehicle's details? Type 'yes' or 'no' to continue"
      elsif input == "yes"
        link = "https://www.enterprisecarsales.com#{Car.all[(takes_input)-1].url}"
        puts "#{link}"
      else 
        puts " #{input} is invalid please type 'list', 'exit', or a number between 1-#{Car.all.length}!"
      end 
    end  
  end 
  
  def close 
    puts "closing search..."
    sleep(2)
  end   
    
end 