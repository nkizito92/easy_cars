class VehicleRankgins::Ranks 
  
  attr_accessor :model, :price, :url, :rank 
  
  
  
  def self.scrape_car 
    doc = Nokogiri::HTML(open("https://www.cars.com/"))
  end 
  
end 