class VehicleRankings::Ranks 
  
  attr_accessor :model, :price, :url, :rank 
  
  
  
  # def self.scrape_car 
  #   doc = Nokogiri::HTML(open("https://www.cars.com/"))
  # end 

  def self.working
     puts <<-Doc.gsub /^\s*/, '' 
         1. SUV
         2. Sedan 
         3. Couple 
         4. Van
         5. Truck
        Doc
  end 
  
end 