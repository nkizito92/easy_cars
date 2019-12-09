class Scraper 
    def self.scrape_vehicles 
        scraped_car_info = {car_nodes: [], price_nodes: []}
        doc = Nokogiri::HTML(open("https://www.enterprisecarsales.com/list/buy-a-car/models=Fiat,Genesis,Jaguar+sort=make_sidebar,asc,,model_sidebar,asc+viewType=overview"))
        name = doc.xpath("//div[@itemprop='name']").text.gsub("201", "+201").split("+")[1..-1]
        price = doc.xpath("//div[@class='pricing_value_3 value']").text.gsub("$", " $").split(" ")
      
        scraped_car_info[:price_nodes] = price
        scraped_car_info[:car_nodes] = name 
        scraped_car_info

    end 
    
    def make_cars_from_scraped_info(info_hash)
        # info_hash = 
        #iteratoe over the information in the info hash and make car instances
    end
    
end 