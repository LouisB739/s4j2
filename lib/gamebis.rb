require "pry"

class Gamebis

    attr_accessor :human_player, :players_left, :enemies_in_sight 
        
  def initialize(name)
        enemies = []
        @human_player = HumanPlayer.new(name)
        @player_left = 10
        @enemies_in_sight = []

    end

  def kill_player(player)
    @enemies.delete_if{|user| user.name == player.name}
    end

  def is_still_ongoing?
        if @human_player.life_points > 0 && @player_left > 0 
            return true 
        else
            return false
        end
    end

def new_players_in_sight
    if @player_left == @enemies_in_sight.count
        puts "Tous les joueurs sont déjà en vue"
    else 
       dice =  rand(1..6)
       if dice == 1
        puts "Aucun nouveau joueur n'arrive"
       elsif dice.between?(2,4)
        rand1 = rand(1..2000)
           new_player = Player.new("Joueur_#{rand1}")
           @enemies_in_sight << new_player
           puts "Le joueur #{new_player.name} a été ajouté"
       elsif dice == 5 || dice == 
        rand2 = rand(1..2000)
        rand3 = rand(1..2000)
        new_player1 = Player.new("Joueur_#{rand2}")
        new_player2 = Player.new("Joueur_#{rand3}")
        @enemies_in_sight.push(new_player1,new_player2)
        puts "Les joueurs #{new_player1.name} et #{new_player2.name} ont été ajouté"
       end
    end
end
end



  def show_players
     puts "Vous avez #{@human_player.life_points} points de vie et il reste #{@enemies.count} enemies à vaincre" 
  end

  def menu()

    i = 0
    puts self.show_players
    puts "Quelle action veux-tu effectuer ?
    "

    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner
    "
    
    puts "attaquer un joueur en vue :"

    @enemies.each do |enemy|
        if enemy.life_points > 0
     puts "#{i} -  #{enemy.show_state} "
    i += 1
        end
    end

  end
    
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
 
 def enemies_attack
 
    puts "Les autres joueurs t'attaquent !"

    @enemies.each do | players |
            players.attacks(@human_player)   
    end

  end

  def end
    puts "GAME OVER"
    if @human_player.life_points>0
        puts "Tu as gagné"
    elsif @human_player.life_points <= 0
        "Tu as perdu"
    end
end

end

