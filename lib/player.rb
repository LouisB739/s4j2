require "pry"

class Player
    attr_accessor :name, :life_points

def initialize(name)
    @name = name
    @life_points = 10

end

#Montre le nom et le nb de points de vie restant
def show_state
    return "#{@name} a #{@life_points} poitns de vie"
end

#Inflige les dommages aux points de vie
def gets_damage(damage)
    @life_points = @life_points - damage

end

#Simule une attack entre deux joueurs
def attacks(player)
    puts  "le joueur #{self.name} attaque le joueur #{player.name}"
    damage = compute_damage
    player.gets_damage(damage)
    if @life_points <= 0
        puts "Le joueur #{@name} a été tué"
    else
    puts "#{self.name} inflige #{damage} points de dégats"
    end
end

#Calcul les dommages de manière aléatoire (entre 1 et 6)
def compute_damage
    return rand(1..6)
  end

end


#Classe du joueur humain, plus fort !

class HumanPlayer < Player

    attr_accessor :weapon_level

    #On ajoute des points de vies (100) ainsi qu'un nouvel attritbut, weapon_level
def initialize(name)
    @life_points = 100
    @weapon_level = 1
    @name = name
end

#On ajoute le weapon level 
def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
end

#On calcul les dommages de manières aléatoire avec un facteur multiplicateur, le weapon level
def compute_damage
    rand(1..6) * @weapon_level
  end


def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
        @weapon_level = new_weapon_level
        puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else 
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end

end

def search_health_pack
    search = rand(1..6)
    if search == 1 
     puts  "Tu n'as rien trouvé... "
    elsif search.between?(2,5)
     @life_points += 50
     if @life_points > 100
         @life_points = 100
     end
     puts "Bravo, tu as trouvé un pack de +50 points de vie !"
     elsif search == 6 
         @life_points += 80
         if @life_points > 100
             @life_points = 100
         end
         puts "Waow, tu as trouvé un pack de +80 points de vie !"
 end
 
 end

end

