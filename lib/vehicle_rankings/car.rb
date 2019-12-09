class Car
    attr_accessor :name, :price, :url

    @@all = []

    def initialize
        save
    end 

    def self.all
        @@all 
    end 
    
    # def self.cars
    #     i = 0
    #     vehi = Scraper.scrape_vehicles[:car_nodes]
    #     cost = Scraper.scrape_vehicles[:price_nodes]
    #     while i != vehi.length
    #         car = self.new 
    #         car.name = vehi[i]
    #         car.price = cost[i]
    #         i+=1
    #     end 
    #    vehicles = self.all.sort_by {|car| car.price}
    #     # int_to_string(vehicles[1].price)
    
    # binding.pry
    # end 

    # def self.int_to_string(prices) 
    #     x = 0
    #      while x != prices.length 
    #           prices[x].price.to_s.split("").unshift("$").join
    #             x+=1
    #      end 
    # end 

    def save 
        @@all << self 
    end

    def self.create
        i = 0
        vehi = Scraper.scrape_vehicles[:car_nodes]
        cost = Scraper.scrape_vehicles[:price_nodes]
        site = Scraper.scrape_vehicles[:url_nodes]
        while i != vehi.length
            car = self.new 
            car.name = vehi[i]
            car.price = cost[i]
            car.url = site[i]
            i+=1
            binding.pry
        end 
        # car.url = site 
        # self.all.each.with_index(1) {|car, x| puts "#{x}. #{car.name}- #{car.price}"} 
        # puts "\nVist the website #{car.url}"
        
        # self.all.each {|car| puts "#{car.name} - #{car.price}"}
        # self.all.sort_by {|car| car.price.length}
        # binding.pry
    end

    # def self.sort_by_price 
    #     cars.all.sort_by {|car| car.price.length}
    #     puts "#{cars}"
    #     binding.pry
    # end 
    
end 