# CLI controller 
require "launchy"
class VehicleRankings::CLI
  def call 
    list_cars
    models
    close
  end 
  
  # desired setup for list of vehicles 
  def list_cars
    # vehicles = VehicleRankings::Scraper.scrape_vehicles.each {|car, price| puts "#{car[:car_nodes]}"}
    Car.print_all
  end 

  def models
    # check the input if valid 
    puts "\nEnter the number for the vehicle 'body' or type 'list' to see list of bodies or type 'exit' to quit"
     input = nil
    #  This is not quite there yet
    while input != "exit"
      input = gets.strip.downcase
      if input == "list"
        list_cars
      elsif input == "cars" 
        Car.all
      elsif input == "exit"
        # do nothing
      elsif input.to_i > 0 && input.to_i <= Car.all.length
        puts "\nYou selected #{Car.all[(input.to_i)-1].name}"
        puts "\nView this vehicles details type 'details'"
      elsif input == "details"
        link = "https://www.enterprisecarsales.com#{Car.all[(input.to_i)-1].url}"
        Launchy.open("#{link}")
      else 
        puts " #{input} is invalid please type 'list', 'exit', or a number between 1-#{Car.all.length}!"
      end 
    end  
  end 
  
  def close 
    puts "closed search!!"
  end   
    
end 