#caesar-cypher.rb
#This will shift every letter in a passes string down a passed number
#Works with huge numbers (it cycles back around) and negatives
require 'pry'
def find_shifted_char(upper_limit, lower_limit, character, shift)
    if character + shift > upper_limit
        return lower_limit + ((character+shift)-upper_limit)
    else 
        return character + shift
    end
end
def caesar_cypher(string, number)
    shift = number%26
    if shift<0
        shift = 26 + shift 
    end
    character_array = string.split('')
    number_array = character_array.map do |character| 
        character.ord
    end
    shifted_array = number_array.map do |character|
        if character.ord > 64 && character.ord <91
            character = find_shifted_char(90, 64, character, shift)
        elsif character.ord>96 && character.ord<123
            character = find_shifted_char(122, 96, character, shift)
        else  
            character = character
        end
    end
    new_character_array = shifted_array.map do |character|
        character.chr
    end
    shifted_string = new_character_array.join
    return shifted_string
end

p caesar_cypher("z", 1) #"a"
p caesar_cypher("This is a test!!!", 5) #"Ymnx nx f yjxy!!!"
p caesar_cypher("This is a MAJOR Test.", 100) #"Pdeo eo w IWFKN Paop."
p caesar_cypher("Negative Test!", -1) #"Mdfzshud Sdrs!"