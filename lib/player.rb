#Que faut-il pour faire un combat ? Moi j'ai en tête qu'il faut a minima :

#2 joueurs ;
#Que chaque joueur ait un niveau de vie donné ;
#Que ce niveau de vie baisse à chaque attaque subie ;
#Si la vie atteint zéro, le personnage est mort.

#Difficile de faire plus simple... Alors allons-y ! On va commencer par coder tout ça dans 
#le fichier player.rb qui va donc accueillir la classe Player dont le but est de modéliser 
#un joueur. Je vais te décrire chaque caractéristique d'un objet Player, charge à toi d'écrire le code !


# ¿WHY?

#Un joueur possède 2 attributs que tu vas mettre en attr_accessor : un nom @name (string) et un niveau de vie @life_points (integer).


class Player

	attr_accessor :name, :life_points # on défini les attributs en lecture ecriture
	
# The initialize method is part of the object-creation process in Ruby & it allows you to set the initial values for an object.
# In other programming languages they call this a “constructor”.

def initialize (name)
		@name = name
		@life_points = 10 # on attribu 10 points de vie en début de partie
	end

	
	def show_state # On affiche les HP du player
		puts "#{@name} a  #{@life_points} points de vie "
	end
	
	# Passons maintenant à une méthode indispensable pour un combat : celle qui fait baisser le niveau de vie du joueur. En gros je veux pouvoir modéliser 
	# "le joueur stocké dans l'objet player1 subit 5 points de dommage" en faisant un player1.gets_damage(5).
	
	def gets_damage (amount)
		@life_points = @life_points - amount
	
	if @life_points <= 0 then 	#Une fois la soustraction faite, la méthode vérifie si @life_points est inférieur ou égale à zéro. Si c'est le cas, c'est que le joueur est mort : elle affiche un message "le joueur XXXX a été tué !".

			puts "Player #{@name} a été tué !"
		end
	end
	
	# Player : attaquer avec attacks
	#On est à présent capable de faire baisser les points de vie d'un joueur avec gets_damage. Il est temps de coder une méthode attacks qui permette de faire 
	#qu'un joueur attaque un autre. Ainsi, si le joueur player1 attaque le joueur player2, on aurait juste à taper player1.attacks(player2).
	def attacks (player2)
		puts "Le joueur #{@name} attaque le joueur #{player2.name}"
		dmg = compute_damage
		puts "il lui inflige #{dmg} points de dégats"
		player2.gets_damage(dmg)
  
	end
	# génération des dommages
	def compute_damage
    	return rand(1..6)
  	end
end
	












