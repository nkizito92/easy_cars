# CLI controller 
class EasyCars::CLI 
  def call 
    welcome
    Car.create
    list_cars
    start
    close
  end 

  def welcome 
    puts "*******************************************"
    puts "*                                         *"
    puts "*          WELCOME TO EASY CARS!!         *"
    puts "*                                         *"
    puts "*******************************************"
    puts "Press 'enter' key to continue"
    gets.strip
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
      if input == "list"
        list_cars
      elsif input.to_i > 0 && input.to_i <= Car.all.length 
        takes_input = input.to_i
        user_input = Car.all[(takes_input)-1]
        checker(user_input)
      elsif input == "cheap" 
        cheapest
        user_input = Car.cheapest
      elsif input == "exit"
        # do nothing
      else 
        puts " #{input} is invalid please type 'list', 'exit', or a number between 1-#{Car.all.length}!"
      end 
    end  
  end 

  def cheapest 
    cheap = Car.cheapest 
        puts "********** #{cheap.name} - $#{cheap.price} ************"
        puts "==================================================================="
        yes_or_no_menu(cheap)
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
    puts "Type any key and press 'enter' to continue.\n" 
    links_input = gets.strip 
      links_input == "link" ? link(car) : main_menu
  end 

  def link(car)
       puts "Hold ctrl/command and click the link below."
       puts "==================================================================="
       puts "#{Scraper.site+car.url}"
       puts "==================================================================="
       puts "\nType 'list' and press 'enter' to see a list of vehicles again."
  end 

  def checker(car)
    puts "==================================================================="
    puts "You selected #{car.name}"
    puts "\nIt cost $#{car.price}"
    puts "==================================================================="
    yes_or_no_menu(car)
  end

  def yes_or_no_menu(something)
    puts "\nWould you like to view the details of this vehicle? Type 'yes' and press 'enter'."
    puts "Type any key and press 'enter' to return to main menu.\n"
    new_input = gets.strip.downcase
    new_input == "yes" ? details(Scraper.details(something)) : main_menu
  end 
  
  def main_menu
    puts "returning to the main menu... "
    sleep(2)
    list_cars 
  end 
  def close 
    puts "closing search..."
    sleep(2)
  end   
    
end 