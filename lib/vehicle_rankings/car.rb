class Car
    attr_accessor :name, :price, :url

    @@all = []

    def initialize
        @name = name
        @price = price
       save 
    end 

    def self.all
        @@all 
    end 

    def get_cars
        Scraper.scrape_vehicles[:car_nodes]
    end 
    
    def self.print_all
        i = 0
        vehi = Scraper.scrape_vehicles[:car_nodes]
        cost = Scraper.scrape_vehicles[:price_nodes]
        while i != vehi.length
            car = self.new 
            car.name = vehi[i]
            car.price = cost[i]
            i+=1
        end 
        # self.all.each.with_index{|car| puts "#{car.name}- #{car.price}"} 
        self.all.each {|car| puts "#{car.name} - #{car.price}"}
        binding.pry
    end

    def save 
        @@all << self
    end 

    def self.sort_by_price 
        print_all.sort_by {|car| car.price.length}
    end 

end 