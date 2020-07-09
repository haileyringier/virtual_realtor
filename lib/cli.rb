class Cli

    
    # See if variables can be kept within the method 
    @client_bedroom = 0
    @client_bathroom = 0
    @client_yard = true
    @client_location = ""
    @available_houses = []
    @house_addresses = []

def welcome_user
puts "Welcome to Virtual Realtor"
    prompt = TTY::Prompt.new
    name = prompt.ask("May I get your name?")
    answer = Client.all.name.include? name 
    puts answer
    if answer == false 
    Client.create(name: name)
    end

    def bedroom_prompt
        prompt = TTY::Prompt.new
        @client_bedroom = 
            prompt.select("How many bedrooms does your dream home have?", %w(1 2))
    end


    # Allow User to select one of the choices. Make sure there are no duplicates
    
    # def bathroom_prompt
    #     puts "How many bathrooms would you like your house to have? 1-2"
    #     @client_bathroom = gets.strip
    #end
    # Allow User to select one of the choices. Make sure there are no duplicates
    
    def bathroom_prompt
        prompt = TTY::Prompt.new
        @client_bathroom = 
            prompt.select("How many bathrooms does your dream home have?", %w(1 2))
    end

    def backyard_prompt
        prompt = TTY::Prompt.new
        @client_yard = 
            prompt.yes?("Does your dream home have a backyard?", convert: :boolean)
    end
    
    def client_location
        prompt = TTY::Prompt.new
       @client_location =  prompt.select("What city would you like your dream home to be in?", %w(Denver Littleton Boulder))
    end
    
    # def house_options
    #     # pull the houses that fulfill each filter
    #     # House.select do 
    #     # provide array of homes that fulfill filters
    #     # Ask user which house they would like to view first
    # end

    def house_filter
        @available_houses = House.all.find_all do |house|
            house.bedrooms.to_i == @client_bedroom.to_i
        end.find_all do |house|
            house.bathrooms.to_i == @client_bathroom.to_i
        end.find_all do |house|
            house.yard == @client_yard
        end.find_all do |house|
            house.location.to_s == @client_location.to_s
        end
        puts @available_houses.var_names
    end

    def view_house
        prompt = TTY::Prompt.new
        @house_view = prompt.select("Which house would you like to view?", @house_addresses)
        puts "Great! You'll be viewing #{@house_view}!"
        # Create new viewing. TEST vvvvvvvv
        Viewing.create(client: , house: @house_view)
    end

    def houses_viewed
        @houses_viewed = Viewing.house
        # @houses_viewed = []
        # @houses_viewed << Cli.view_house
        # puts @houses_viewed
    end

    def buy_house
        promp = TTY::Prompt.new
        @house_bought = prompt.select("Which house would you like to buy? These are the houses you viewed", @houses_viewed)
        puts "Congratulations! You just bought #{@house_bought}!"
    end

    def delete
        # When buy_house is run, delete the client and the house
        # Make it a find_by all
        user_delete = Client.find_by(name: "#{user}")
        user_delete.destroy
        house_delete = House.find_by(address: "#{@house_bought)}")
    end


     @house_addresses = @available_houses.map do |house|
        house.location
     end
     n = @house_addresses.length
    puts "#{n} house(s) match your selections"
    puts @house_addresses
end

end
 
