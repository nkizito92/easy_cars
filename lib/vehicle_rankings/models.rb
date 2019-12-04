class VehicleRankings::Model 
  # VehicleRankings::Model.scrape_car
  attr_accessor :category, :name, :price, :year, :url, :rate 
  
  
  def self.makes 
    self.scrape_makes
  end

  def self.type 
    makes << self.scrape_type
  end 
  
  def self.scrape_makes 
    makes = []
    makes << self.scrape_vehicle
  end 

  def self.scrape_vehicle
    vehicle = self.new
    doc = Nokogiri::HTML(open("https://www.kbb.com/car-reviews/"))
    # finds all categorys in puts them in a number list
    vehicle.category = doc.css(".category-container.js-category-click").text.gsub("\n\t", "").split
    vehicle.name = doc.css(".js-browseby-make").text.gsub("\n\t", "").split
    vehicle
    # binding.pry
  end 
  
  # def self.scrape_type
  #   vehicle = self.new
  #   price_r = Nokogiri::HTML(open("https://www.kbb.com/car-finder/?morefilters=topratedexpert/"))
  #   vehicle.price = price_r.css("css-1t7td5n e53mcov2").text.gsub("\n\t", "").split
  #   vehicle 
  # end

  
end 