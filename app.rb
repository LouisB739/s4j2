
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


#On initialise 2 nouveaux joueurs, Josiane et José

player1 = Player.new("Josiane")
player2 = Player.new("José")


#Début de la boucle qui se finira lorsque l'un des deux joueurs aura 0 points de vie

while player1.life_points >= 0 && player2.life_points >= 0
    puts "Voici l'état de chaque joueurs"
    #Montre les pv des joueurs
    puts player1.show_state
    puts player2.show_state
    puts "Passons à la phase d'attaque :"

    #Simule une attack avec la méthode attacks(player)
    player1.attacks(player2)
    #Si les pv arrive à 0 alors on sort de la boucle
    if player2.life_points <= 0
        break
    else
    player2.attacks(player1)
    end
end

puts player1.show_state
puts player2.show_state



