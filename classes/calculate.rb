require 'colorize'
require 'tty-prompt'
require 'artii'
require 'rainbow'
require 'colorized_string'
require 'faker'

require_relative 'backtomenu.rb'


def user_request(foods,pending_cal)
    
    puts "Please enter a value between 1 and " + foods.length.to_s + ": \n"
    foodoption = gets.to_i

    if foods[foodoption-1].servingtype == 'gm'
        puts ("Please enter the serving as 100..200 gm ").colorize(:green)
        servingsize = gets.to_f / 100

    else
        puts ("Please enter the serving/cup").colorize(:green)
        servingsize = gets.to_i

    end 

    #servingsize = gets.to_i
        
    total_cal_food = servingsize * foods[foodoption-1].calorie
    puts ("calorie of the last food : "+ total_cal_food.to_s  ).colorize(:red) 

    pending = pending_cal - total_cal_food

    total_consumed = 2000 - pending
    puts ("Total || You have already ordered food with : "+total_consumed.to_s + " calorie" ).colorize(:green) 
        
    if (pending < 0 ) 
            
        puts ("You have reached 2000 cal for the day ").colorize(:red) 
        
    else  
        puts ("You can still consume  : "+pending.to_s + " calorie" ).colorize(:green) 
               
    end 
        
    return pending
end 

def calculate_cal

    puts ("-----------------------------------------------------------------------").colorize(:yellow)
    puts ("")
    foods = list_of_food
    count = 0 
    puts ("Please select options 1,2 .. 8  to choose food ")
    while count < foods.length

        puts (foods[count].id.to_s + " : " + foods[count].name)
        count+=1
    end 

    puts ("")
    
    pending_cal = 2000
    pending = user_request(foods, pending_cal)
   
    while pending > 0
        puts ("")
        puts ("Please enter 1  if you want to contunue, or 2 to finish order : ")
        ordercon = gets.to_i
        case ordercon

        when 1
            puts ("Please select options 1,2 .. 8  to choose food ")
            pending_cal = pending
            pending= user_request(foods,pending_cal)
    
        when 2
            pending = 0
            break
        else
            puts ("WRONG CHOICE !! Please enter 1  if you want to contunue, or 2 to finish order: ")

        end 
  
    end
     
    #puts ("")
    #puts ("-----------------------------------------------------------------------").colorize(:red)
    
    backtomenu
    

end


