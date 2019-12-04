class VehicleRankings::Model 
  
  attr_accessor :name, :price, :year, :url, :rate 
  

  def self.models 
    self.scrape_models
  end

  def self.scrape_models 
    models = []
    models << self.scrape_site
  end 

  def self.scrape_site
    doc = Nokogiri::HTML(open("https://www.cars.com/"))
    binding.pry
  end 
  
end 