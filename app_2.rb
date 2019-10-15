require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "Quelle est ton prénom?"
prénom = gets.chomp
user = HumanPlayer.new(prénom)

enemies = []

player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies.push(player1, player2)


while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)

    puts user.show_state
    puts "Quelle action veux-tu effectuer ?
    "

    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner
    "
    
    puts "attaquer un joueur en vue :"
    puts "0 -  #{player1.show_state}"
    puts "1 - #{player2.show_state} "

    decision = gets.chomp

    if decision == "a"
        user.search_weapon
    elsif decision == "s"
        user.search_health_pack
        elsif decision == "0"
            user.attacks(player1)
            elsif decision == "1"
                user.attacks(player2)
            end
            puts "Les autres joueurs t'attaquent !"


    enemies.each do | players |
        if players.life_points >= 0
            players.attacks(user) 
        else 
            puts "#{players.name} ne peut pas attaquer car il est mort"          
        end
    end

    gets.chomp

  end



puts "La partie est finie"
if user.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
elsif user.life_points < 0
    puts "Loser ! Tu as perdu !" 
end

binding.pry