# CLI controller 
class VehicleRankings::CLI
  attr_accessor :body, :make, :vehicle_set
  @@all = []
  @@makers = []

  def initialize 
    # @vehicle_set = []
    @body = body
    @make = make
  end 

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
        list_makes
        makes 
      elsif input == "exit"
        # do nothing
      elsif input.to_i > 0 && input.to_i <= @@all.length
        puts "\nYou selected #{@@all[(input.to_i)-1]}"
        @body = @@all[(input.to_i)-1]
        list_makes
        makes
      else 
        puts " #{input} is invalid please type 'list', 'exit', or a number between 1-#{@@all.length}!"
      end 
    end  
  end 

  def makes 
    puts "\nType the 'number' listed for Make or type 'done', 'list', or 'cars' to select Make or done;\nShow listed category or Make again."
    input2 = nil
   #  This is not quite there yet
   while input2 != "done"
    input2 = gets.strip.downcase
    if input2 == "list"
      list_category
    elsif input2 == "cars" 
      list_makes
      makes 
    elsif input2.to_i > 0 && input2.to_i <= @@makers.length
      puts "\nYou selected #{@@makers[(input2.to_i)-1]}"
      @make = @@makers[(input2.to_i)-1]
      puts "You selected the body type '#{@body}' and Make '#{@make}' type 'results' to show see price and ratings"
    elsif input2 == "done"
      # do nothing
    elsif input2 == "results"
      results
    else 
      puts " #{input2} is invalid please type 'list', 'exit', or a number between 1-#{@@makers.length}!"
    end 
    end
  end 

  def close 
     puts "closed search!!"
  end  
  def results 
     # visits the class and checks body type and Make of the car selected 
     # display prices and the ratings  
    Cars.all.select {|car|  } 
  end  

end 