require "pry"

class Gamebis
#On précise les attributs que nous allons utiliser dans cette classe
    attr_accessor :human_player, :players_left, :enemies 


     #On initialise l'objet en lui donnant certaines charactéristiques : Il va créer un joueur humain automatiquement, assigner la valeur 10 à la variable (ou attribut) "player_left",
     #qui correspondra au nombre de joueur restant à vaincre, créer un array vide enemies qui va contenir les enemies combattables 
    
    
  def initialize(name)
        enemies = []
        @human_player = HumanPlayer.new(name)
        @player_left = 10

    end



    #On définie un fonction qui supprime un joueur de l'array enemies

  def kill_player(player)
    @enemies.delete_if{|user| user.name == player.name}
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
     puts "Vous avez #{@human_player.life_points} points de vie et il reste #{@enemies.count} enemies à vaincre" 
  end

  #Affiche le menu des actions possibles à effectuer par le joueur humain ainsi que les enemies qu'il peut attaquer

  def menu()

    i = 0
    puts self.show_players
    puts "Quelle action veux-tu effectuer ?
    "

    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner
    "
    
    puts "attaquer un joueur en vue (entre son numéro):"

    @enemies.each do |enemy|
        if enemy.life_points > 0
     puts "#{i} -  #{enemy.show_state} "
    i += 1
        end
    end

  end


  
  #Cette fonction simule les conséquences du choix de l'utilisateur parmis les choix proposés dans la fonction menu. Il peut chercher une nouvelle arme, se soigner, ou alors attaquer
  #un des joueurs qui est ds l'array enemies
    
def menu_choice(string)

    if string == "a"
        @human_player.search_weapon
    elsif string == "s"
        @human_player.search_health_pack
    else
            @human_player.attacks(@enemies[string.to_i])
            if @enemies[string.to_i].life_points <= 0
                kill_player(enemies[string.to_i])
                puts "le joueur #{@enemies[string.to_i].name} a été tué et retiré de la liste des enemies"
            end
            end
            
            
            
            #Simule l'attaque de tous les joueurs dans l'array enemies_in_sight sur le joueur humain
 

 def enemies_attack

    if not @enemies.empty?
 
    puts "Les autres joueurs t'attaquent !"

    @enemies.each do | players |
            players.attacks(@human_player)   
    end
end

  end

  #Message de fin

  def end
    puts "GAME OVER"
    if @human_player.life_points>0
        puts "Tu as gagné"
    elsif @human_player.life_points <= 0
        "Tu as perdu"
    end
end

end

