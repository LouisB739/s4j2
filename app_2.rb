require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#Petit message d'intro

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

#On va demander à l'utilisateur son prénom afin de créer un joueur humain qui aura ce prénom

puts "Quelle est ton prénom?"
prénom = gets.chomp
user = HumanPlayer.new(prénom)

enemies = []

player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies.push(player1, player2)

#Boucle qui continue jusqu'a le joueur humain ait 0 pv ou que les deux players arrivent à 0hp

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

    #arbre de décision pour le joueur humain

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

#Boucle pour simuler l'attack des joueurs sur le joueur humain
    enemies.each do | players |
        if players.life_points > 0
            players.attacks(user) 
        else 
            puts "#{players.name} ne peut pas attaquer car il est mort"          
        end
    end

    gets.chomp

  end

#On vérifie le niveau des pv pour conclure sur la victoire ou la défaite du joueur humain

puts "La partie est finie"
if user.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
elsif user.life_points < 0
    puts "Loser ! Tu as perdu !" 
end

binding.pry