class VehicleRankings::Model 
  
  attr_accessor :name, :price, :url, :rate 
  
  def self.models 
    # puts <<-Doc.gsub /^\s*/, '' 
    # 1. SUV
    # 2. Sedan 
    # 3. Couple 
    # 4. Van
    # 5. Truck
    # Doc
    
    model = self.new 
    model.name = "Suv"
    model.price = "$199"
    model.rate = "3 stars"
    model.url = "https://www.cars.com/"
    [model]
  end
  
end 