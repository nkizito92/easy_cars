class Car
    attr_accessor :name, :price, :url, :mileage, :mpg, :ext_color, :int_color, :fuel_type, :engine, :drivetrain, :location
    @@all = []
    def initialize(name, price, url, mileage="nil", mpg="nil", ext_color="nil", int_color="nil", fuel_type="nil", engine="nil", drivetrain="nil", location="nil")
        @name = name
        @price = price
        @url = url
        @mileage = mileage
        @mpg = mpg
        @ext_color = ext_color
        @int_color = int_color
        @fuel_type = fuel_type 
        @engine = engine
        @drivetrain = drivetrain
        @location = location
        @@all << self
    end  

    def self.all
        @@all 
    end 

    def self.create
        i = 0
        hash = Scraper.scrape_vehicles
        while i != hash[:car_nodes].length
            self.new(hash[:car_nodes][i], hash[:price_nodes][i].to_i, hash[:url_nodes][i])
            i+=1
        end 
    end

    def self.print_all
        self.all.each.with_index(1) {|car, x| puts "#{x}. #{car.name} - $#{car.price}"} 
    end 

    def self.print_cars
        self.all.each.with_index(1) {|car, x| puts "#{x}. #{car.name}"} 
    end
    def self.cheapest 
        self.all.sort_by {|car| car.price}[0] 
    end 
end 