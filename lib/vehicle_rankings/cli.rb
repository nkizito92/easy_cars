# CLI controller 
class VehicleRankings::CLI
  def call 
    list_category
    models
    close
  end 
  
  # desired settup for list of vehicles 
  def list_category
    # binding.pry
     @vehicles = VehicleRankings::Model.makes
     @vehicles.each {|vehicle|
     # shows category arr and then number list each element
     vehicle.category.each.with_index(1) {|type, index| puts "#{index}. #{type}"} }
    end 
    
  def list_makes 
    # shows the car make name arr and then number list each element
    @vehicles.each {|make| make.name.each.with_index(1) {|type, index| puts "#{index}. #{type}"} }
  end 

  def models
    # need to make input equal the category number 
    # print the category name
    # check the input if valid 

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
        list_category
      when "cars"
        list_makes
      when "exit" 
      else
        # change between 1 to 5 to (1 through list_models) 
        puts " #{input} is invalid please type list, exit, or a number between 1, #{@vehicles.length}"
      end 
    end  
  end 
  def close 
     puts "closed search!!"
  end  

end 