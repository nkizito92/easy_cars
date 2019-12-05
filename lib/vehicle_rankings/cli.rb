# CLI controller 
class VehicleRankings::CLI
  attr_accessor :makers 
  @@all = []
  @@maker = []
  def call 
    list_category
    models
    close
  end 
  
  # desired setup for list of vehicles 
  def list_category
     @vehicles = VehicleRankings::Model.makes
     # shows category arr and then number list each element
     @vehicles.each {|vehicle| vehicle.category.each.with_index(1) {|type, index| 
     @@all << type
     puts "#{index}. #{type}"} }
  end 
    
  def list_makes 
    # shows the car makers name arr and then number list each element
    @vehicles.each {|make| make.name.each.with_index(1) {|type, index| 
    @@maker << type
    puts "#{index}. #{type}"} }
  end 

  def models
    # need to make input equal the category number 
    # print the category name
    # check the input if valid 
    puts "Enter the number for the vehicle 'type' or type 'list' to see list of models or type exit to quit"
     input = nil
    #  This is not quite there yet
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "list"
        list_category
      when "cars"
        list_makes
      when input
        puts "You selected #{@@all[(input.to_i)-1]}"
      when "exit" 
      else
        # change between 1 to 5 to (1 through types of vehicles) 
        puts " #{input} is invalid please type 'list', 'exit', or a number between 1-#{@@all.length}!"
      end 
    end  
  end 

  def close 
     puts "closed search!!"
  end  

end 