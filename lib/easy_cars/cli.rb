# CLI controller 
class EasyCars::CLI 
  def call 
    Car.create
    list_cars
    start
    close
  end 
  
  # setup for list of vehicles 
  def list_cars
    puts "==================================================================="
    Car.print_all
    puts "==================================================================="
    puts "\nEnter a number and press 'enter' to pick the desired vehicle." 
    puts "Type 'exit' to quit."
    puts "\nTo see the cheapest car type 'cheap'."
  end 

  def start
    input = nil
    while input != "exit"
      input = gets.strip.downcase 
      if input == "list" || input == "no"
        list_cars
      elsif input == "cars" 
        Car.print_cars
      elsif input.to_i > 0 && input.to_i <= Car.all.length
        takes_input = input.to_i
        user_input = Car.all[(takes_input)-1]
        # checks the input if valid 
        puts "==================================================================="
        puts "You selected #{user_input.name}"
        puts "\nIt cost $#{user_input.price}"
        puts "==================================================================="
        puts "\nWould you like to view the details of this vehicle? Type 'yes' and press 'enter'."
        puts "Type 'no' and press 'enter' to continue.\n"
      elsif input == "yes" 
        selection = Scraper.details(user_input)
        details(selection)
      elsif input == "cheap"
        cheapest
        user_input = Car.cheapest
      elsif input == "exit"
        # do nothing
      elsif input == "link"
       puts "Hold ctrl/command and click the link below."
       puts "==================================================================="
       puts "#{Scraper.site+user_input.url}"
       puts "==================================================================="
       puts "\nType 'list' and press 'enter' to see a list of vehicles again."
      else 
        puts " #{input} is invalid please type 'list', 'exit', or a number between 1-#{Car.all.length}!"
      end 
    end  
  end 

  def cheapest 
    cheap = Car.cheapest 
        puts "********** #{cheap.name} - $#{cheap.price} ************"
        puts "==================================================================="
        puts "\nWould you like to see this cars details? Type 'yes' and press 'enter'."
        puts "Type 'no' and press 'enter' to continue."
  end 

  def details(car) 
    puts "==================================================================="
    puts "#{car.name} cost $#{car.price}"
    puts "#{car.mileage}"
    puts "#{car.mpg}" if car.mpg != ""
    puts "#{car.ext_color}"
    puts "#{car.int_color}"
    puts "#{car.fuel_type}"
    puts "#{car.engine}"
    puts "#{car.drivetrain}"
    puts "==================================================================="
    puts "Want to visit this vehicle's site? Type 'link' and press 'enter'." 
    puts "Type 'no' and press 'enter' to continue.\n" 
  end 
  
  def close 
    puts "closing search..."
    sleep(2)
  end   
    
end 