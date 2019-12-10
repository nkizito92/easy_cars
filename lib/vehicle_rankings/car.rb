class Car
    attr_accessor :name, :price, :url

    @@all = []

    def initialize
        @@all << self
    end 

    def self.all
        @@all 
    end 

    def self.create
        i = 0
        vehi = Scraper.scrape_vehicles[:car_nodes]
        cost = Scraper.scrape_vehicles[:price_nodes]
        site = Scraper.scrape_vehicles[:url_nodes]
        while i != vehi.length
            car = self.new 
            car.name = vehi[i]
            car.price = cost[i].to_i
            car.url = site[i]
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
        cheap_car = self.all.sort_by {|car| car.price} 
        puts "#{cheap_car[0].name} - $#{cheap_car[0].price}"

        # binding.pry
    end 
end 