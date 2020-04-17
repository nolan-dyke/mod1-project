class Cli
    attr_reader :user

    def initialize
        
    end

    def welcome
        prompt = TTY::Prompt.new
        puts "\n\n
         _____ _             ____      _                     _       
        |_   _| |__   ___   / ___|___ | | ___  _ __ __ _  __| | ___  
          | | | '_  |/ _ \ | |   | _ || || _ || '__| _` |/ _` || _ | 
          | | | | | |  __/ | |__| (_) | | (_) | | | (_| | (_| | (_) |
          |_| |_| |_||___|  |____|___/|_||___/|_|  |__,_||__,_||___/ 
                                                                     
                 __  __ _                _                    
                |  |/  (_) ___ _ __ ___ | |__   ___  ___ _ __ 
                | ||/| | |/ __| '__/ _ || '_ | / _ |/ _ | '__|
                | |  | | | (__| | | (_) | |_) |  __/  __/ |   
                |_|  |_|_||___|_|  |___/|_.__/ |___||___|_|   
                                                              
                     ____       _           _             
                    / ___|  ___| | ___  ___| |_ ___  _ __ 
                    |___ | / _ | |/ _ |/ __| __/ _ || '__|
                     ___) |  __/ |  __/ (__| || (_) | |   
                    |____/ |___|_||___||___||__|___/|_|   "
        puts "\n\n"
        user_name = prompt.ask("Wecome to our app. What is your name?\n")
        puts "\n\nThanks for using the Colorado Beer Suggester, #{user_name}!\n\n"
        set_user(user_name)
        select_type_of_beer
    end

    def select_type_of_beer
        prompt = TTY::Prompt.new
        beer_types = Beer.all.map do |beer|
            beer.beer_type
        end.uniq
        users_favorite_type = prompt.select("\nWhat type of beer do you like?\n", beer_types)
        beer_suggestion(users_favorite_type)
    end 

    def set_user(user_name)
        @user  = User.create(name: user_name)
    end

    def beer_suggestion(users_favorite_type)
        prompt = TTY::Prompt.new
        matching_beers_based_on_type = Beer.all.select do |beer|
            beer.beer_type == users_favorite_type
        end 
        beer_names = matching_beers_based_on_type.map do |beer|
        beer.name
        end.uniq

        selection = prompt.select("Select a beer to view its info: ", (beer_names))
        beer_information(selection)
    
    end

    def beer_information(selection)
        chosen_beer = Beer.all.find do |beer|
        beer.name == selection 
        end
        table = TTY::Table.new ["Name", "Type", "Brewery", "ABV"], [["#{chosen_beer.name}", "#{chosen_beer.beer_type}", "#{chosen_beer.brewery.name}", "#{chosen_beer.abv}"]]
        puts table.render(:unicode) 
        puts "\n"
        add_to_favorites(@user, chosen_beer)
    end

    def add_to_favorites(user, beer)
        prompt = TTY::Prompt.new
        favorites_question = prompt.yes?('Add to beers to try?')
        if favorites_question 
            favorite_one = Favorite.create(user: user, beer: beer)
            puts "Added to your beers to try list!"
            view_favorites
        else 
            back_to_beer = prompt.select("Select a different beer?", %w(beer_selection quit_app))
            if back_to_beer == "beer_selection"
                select_type_of_beer
            else 
                quit_method
            end 
        end

    end

    def view_favorites
        prompt = TTY::Prompt.new
        view_favorites_question = prompt.yes?('View beers to try?')
        
        if view_favorites_question
            favorite_beers = Favorite.all.map do |favorite|
                favorite.beer
            end.uniq
            puts "\n\n"
            table = TTY::Table.new header: ["Beer", "Type", "Brewery", "ABV"] do |t|
                favorite_beers.each do |beer|
                    t << ["#{beer.name}", "#{beer.beer_type}", "#{beer.brewery.name}", "#{beer.abv}"]
                end 
            end 
            puts table.render(:unicode) 
                next_selection = prompt.select('Would you like to', %w(edit_beers_to_try make_another_selection quit_app))
                if next_selection == 'edit_beers_to_try'
                    edit_favorites(favorite_beers)
                elsif next_selection == 'make_another_selection'
                    select_type_of_beer
                else 
                    quit_method
                end       
            
        else
            select_another_question = prompt.select('Would you like to make another selection?', %w(make_another_selection quit_app))
            if select_another_question == "make_another_selection"
                select_type_of_beer
            else
                quit_method
            end   
        end
    end

    def edit_favorites(beers)
        prompt = TTY::Prompt.new
        beer_names = beers.map do |beer|
            beer.name
        end
        deletions = prompt.multi_select('Which beers would you like to remove?', beer_names)
        delete (deletions)
    end

    def delete(deletions)
        favorites_to_delete =  Favorite.all.select do |favorite|
            deletions.include?(favorite.beer.name)    
            end
        favorites_to_delete.each do |favorite|
                favorite.delete 
            end 
        view_favorites
    end 

    def quit_method
        puts  "Thanks for using Colorado Beer Suggester!"
        quit!
    end 

end






