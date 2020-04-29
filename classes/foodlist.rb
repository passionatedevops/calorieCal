require 'colorize'
require 'tty-prompt'
require 'artii'
require 'rainbow'
require 'colorized_string'
require 'faker'

require_relative 'backtomenu.rb'

# define Food class with attributes 
class Food

	attr_accessor :id, :name, :servingsize, :servingtype, :calorie;

    # initialize the data member value of the Food object 
    def initialize(id, name,servingsize, servingtype, calorie)
        @id = id #int
        @name= name #string
        @servingsize = servingsize #int
		@servingtype = servingtype #string
		@calorie = calorie #int
	
	end
end

def read_food(count,foodlist_file)
    #read the value from text file and store into variables
    id= count + 1
    name= foodlist_file.gets.to_s.chomp()
    servingsize= foodlist_file.gets.to_i
    servingtype = foodlist_file.gets.to_s.chomp()
    calorie = foodlist_file.gets.to_i
    #initialize single food object 
    food = Food.new(id,name, servingsize, servingtype, calorie)
    return food
  end



def read_foodlist(foodlist_file)
    foods = Array.new  
    i=0 
    #total number of foods is 8 .. we can change it anytime
    while i < 8 
        #create single food object 
        food = read_food(i,foodlist_file)
        
        #store all food objects in the foods array 
        foods.push food 
        i+=1
    end 
	return foods 
end 

def write_foods(food)
    #print single food object in the terminal
    puts food.id.to_s+". "+ food.name + " - " + food.servingsize.to_s + " " + food.servingtype + " is " + food.calorie.to_s + " caloriees"
    
end 


def write_foodlist(foods)
    i=0
    #using loop through foods array containing all food objects
    while i < foods.length  
        #call method with single food object 
		write_foods(foods[i])
		i+=1
	end

end 


def list_of_food
    
    foodlist_file = File.open("./classes/foodlist.txt", "r")
    foods = read_foodlist(foodlist_file)

    return foods
end


def list

    food_list = Artii::Base.new :font => 'slant'
    puts (food_list.asciify("Food List")).colorize(:cyan)

    puts ("-----------------------------------------------------------------------").colorize(:yellow)
    puts ("")
    
    # open foodlist.txt file
    foodlist_file = File.open("./classes/foodlist.txt", "r")
    
    # read the foods from the foodlist.txt file and store into the foods array of Food objects
    foods = read_foodlist(foodlist_file)

    # close  foodlist.txt file
    foodlist_file.close()

    #write all foods  records in the terminal
    write_foodlist(foods);
    

    puts ("")
    puts ("-----------------------------------------------------------------------").colorize(:red)
    
    # allow user to back to main menu
    backtomenu


end



