require "pry"

class Game

    #On précise les attributs que nous allons utiliser dans cette classe
    attr_accessor :human_player, :players_left, :enemies_in_sight 
    #On initialise l'objet en lui donnant certaines charactéristiques : Il va créer un joueur humain automatiquement, assigner la valeur 10 à la variable (ou attribut) "player_left",
    # qui correspondra au nombre de joueur restant à vaincre, créer un array vide enemies_in_sigh qui correspondra au nombre d'enemis contre lesquels on peut combattre
    def initialize(name)
        @human_player = HumanPlayer.new(name)
        @player_left = 10
        @enemies_in_sight = []
    end

    #On définie un fonction qui supprime un joueur de l'array enemies_in_sight

  def kill_player(player)
    @enemies_in_sight.delete_if{|user| user.name == player.name}
    @player_left -= 1
    end

    #On définie une fonction qui retourne un boléen, true si la partie est encore en cours et false sinon.

    def is_still_ongoing?
        if @human_player.life_points > 0 && @player_left > 0 
            return true 
        else
            return false
        end
    end

    #Permet de montrer le nombre de pv du joueur humain ainsi que le nombre d'ennemis restant à vaincre
  def show_players
     puts "Vous avez #{@human_player.life_points} points de vie et il reste #{@player_left} enemies à vaincre" 
  end

  #Affiche le menu des actions possibles à effectuer par le joueur humain ainsi que les enemies qu'il peut attaquer
def menu

    i = 0
    puts self.show_players
    puts "Quelle action veux-tu effectuer ?
    "

    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner
    "
   
    
    puts "attaquer un joueur en vue :"

    @enemies_in_sight.each do |enemy|
        if enemy.life_points > 0
     puts "#{i} -  #{enemy.show_state} "
    i += 1
        end
    end

    puts "--------"
    print "Alors ? <"

  end

  #Cette fonction permet de rajouter des joueurs dans l'array enemies_in_sight, qui seront donc combattable par le joueur humain

  def new_players_in_sight
    if @player_left == @enemies_in_sight.count
        puts "Tous les joueurs sont déjà en vue"
    else 
       dice =  rand(1..6)
       if dice == 1
        puts "Aucun nouveau joueur n'arrive"
        return
       elsif dice.between?(2,4)
        rand1 = rand(1..2000)
           new_player = Player.new("Joueur_#{rand1}")
           @enemies_in_sight.push(new_player)
           puts "Le joueur #{new_player.name} a été ajouté"
       elsif dice == 5 || dice == 6
        rand2 = rand(1..2000)
        rand3 = rand2 + 1
        new_player1 = Player.new("Joueur_#{rand2}")
        new_player2 = Player.new("Joueur_#{rand3}")
        @enemies_in_sight.push(new_player1,new_player2)
        puts "Les joueurs #{new_player1.name} et #{new_player2.name} ont été ajouté"
       end
    end
end


#Cette fonction simule les conséquences du choix de l'utilisateur parmis les choix proposés dans la fonction menu. Il peut chercher une nouvelle arme, se soigner, ou alors attaquer
#un des joueurs qui est ds l'array enemies_in_sight
    
def menu_choice(string)

until string == "a" || string == "s" || string.to_i.between?(0,enemies_in_sight.count) do
    puts "veuillez rentrer une action possible ou attaquer un numéro de joueur existant, votre tour passe"
    string = gets.chomp
end
    if string == "a"
        @human_player.search_weapon
    elsif string == "s"
        @human_player.search_health_pack
    elsif string.to_i.between?(0,enemies_in_sight.count)
            @human_player.attacks(@enemies_in_sight[string.to_i])
            if @enemies_in_sight[string.to_i].life_points <= 0
                puts "
                --------------------------------------------------
                "
                puts "le joueur #{enemies_in_sight[string.to_i].name} a été tué et retiré de la liste des enemies"
                puts "
                --------------------------------------------------
                "
                kill_player(enemies_in_sight[string.to_i])
            end
        end
    
#Simule l'attaque de tous les joueurs dans l'array enemies_in_sight sur le joueur humain
 
 def enemies_attack
    puts "------ "
    puts "Les autres joueurs t'attaquent !"
    puts " ------"

    @enemies_in_sight.each do | players |
            players.attacks(@human_player)   
    end

  end
#Message de fin
  def end
    puts "------ 
    
    "
    puts "GAME OVER"
    puts  "------
    
    "
    if @human_player.life_points>0
        puts "Tu as gagné"
    elsif @human_player.life_points <= 0
        "Tu as perdu"
    end
end

end
end
