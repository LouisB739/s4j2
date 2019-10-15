require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/gamebis'
require_relative 'lib/player'



puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "Quelle est ton prénom?"
prenom = gets.chomp
my_game = Gamebis.new(prenom)

while my_game.is_still_ongoing?
    my_game.menu
    decision = gets.chomp.to_s
    my_game.menu_choice(decision)
    my_game.enemies_attack
    gets.chomp
end
puts my_game.end


binding.pry


