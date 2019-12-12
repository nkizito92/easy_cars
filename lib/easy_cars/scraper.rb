class Scraper 
    def self.scrape_vehicles 
        scraped_car_info = {car_nodes: [], price_nodes: [], url_nodes: []}
        doc = Nokogiri::HTML(open("https://www.enterprisecarsales.com/list/buy-a-car/models=Fiat,Genesis,Jaguar,Mini+sort=make_sidebar,asc,,model_sidebar,asc+viewType=overview"))
        name = doc.xpath("//div[@itemprop='name']").text.gsub("201", "+201").split("+")[1..-1]
        price = doc.xpath("//div[@class='pricing_value_3 value']").text.gsub("$", " $").split(" ").collect {|pri| pri.gsub(/[$,]/, "")}
        url = doc.css("div.overflow-hidden").map{|one| one.css("a").attribute("href").value}
        scraped_car_info[:price_nodes] = price
        scraped_car_info[:car_nodes] = name 
        scraped_car_info[:url_nodes] = url 
        scraped_car_info
    end 

    def self.details(car_obj)
        site = "https://www.enterprisecarsales.com"
        doc = Nokogiri::HTML(open(site+car_obj.url))
        node = doc.xpath("//div[@class='pv1']")
        colors = doc.xpath("//div[@class='truncate pv1']")
        car_obj.mileage = node[0].text 
        car_obj.mpg = doc.xpath("//div[@class='trigger pv1']").text 
        car_obj.ext_color = colors[0].text 
        car_obj.int_color = colors[1].text  
        car_obj.fuel_type = node[1].text 
        car_obj.engine = node[2].text 
        car_obj.drivetrain = node[3].text 
        car_obj.location = node.last.text 
         car_obj.mpg.delete if car_obj.mpg == ""
        car_obj      
    end 

    def self.site 
        "https://www.enterprisecarsales.com"
    end 
end 