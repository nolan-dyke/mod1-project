class Cli
    attr_reader :user

    def initialize
        
    end

    def welcome
        puts "Welcome to our app."
        puts "What is your name?"
        user_name = gets.chomp
        set_user(user_name)
    end

    def set_user(user_name)
        @user  = User.create(name: user_name)
        beer_suggestion
    end

    def beer_suggestion
        prompt = TTY::Prompt.new
        beer_names = Beer.all.map do |beer|
        beer.name
        end
        selection = prompt.select("Select a beer:", (beer_names))
        beer_information(selection)
    
    end

    def beer_information(selection)
        chosen_beer = Beer.all.find do |beer|
        beer.name == selection 
        end
        puts "Name: #{chosen_beer.name}\nType: #{chosen_beer.beer_type}\nABV: #{chosen_beer.abv}\nBrewery: #{chosen_beer.brewery.name}"
        add_to_favorites(@user, chosen_beer)
    end

    def add_to_favorites(user, beer)
        prompt = TTY::Prompt.new
        favorites_question = prompt.yes?('Add to favorites?')
        if favorites_question 
            favorite_one = Favorite.create(user: user, beer: beer)
            view_favorites
        else 
            beer_suggestion
        end

    end

    def view_favorites
        prompt = TTY::Prompt.new
        view_favorites_question = prompt.yes?('View favorites?')
        favorite_beers = Favorite.all.map do |favorite|
            favorite.beer
        end
        

        if view_favorites_question
            favorite_beers.each do |beer|
                puts"Name: #{beer.name} Brewery: #{beer.brewery.name} ABV: #{beer.abv}"
                next_selection = prompt.select('Would you like to', %w(edit_favorites make_another_selection quit_app))
                if next_selection == 'edit_favorites'
                    edit_favorites(favorite_beers)
                elsif next_selection == 'make_another_selection'
                    beer_suggestion
                else 
                    exit!
                end       
            end
        else
            select_another_question = prompt.yes?('Select another beer?')
            if select_another_question
                beer_suggestion
            else
                puts "Thanks for using our app!"
                exit!
            end   
        end
    end

    def edit_favorites(beers)
        prompt = TTY::Prompt.new
        beer_names = beers.map do |beer|
            beer.name
        end
        deletions = prompt.multi_select('Which beers would you like to remove?', beer_names)
        

       favorites_to_delete =  Favorite.all.select do |favorite|
            deletions.each do |deletion|
                favorite.beer.name == deletion 
            end
        end
        
 binding.pry       
    end

end






