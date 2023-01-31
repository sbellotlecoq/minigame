require 'bundler'
Bundler.require

require_relative 'lib/game'

# C'est bon, on a tous les ingrédients pour que nos joueurs se trucident bien comme il faut ! 
# Les joueurs peuvent attaquer, subir des dégâts et on peut donner des infos sur le terminal via plein de puts. 
# Il ne nous reste qu'à mettre en place notre premier combat.

# On va tout coder dans app.rb qui va orchestrer le combat et faire appel à la classe Player. Petite exception à la règle : pas besoin de créer une classe App dans ce fichier.

#Présentons les deux combattants : affiche dans le terminal l'état de chaque combattant grâce à des puts et des show_state. Juste avant, affiche un petit puts "Voici l'état de chaque joueur :".
#Fight ! Indique que le combat commence avec un puts "Passons à la phase d'attaque :".
#Josiane aura l'honneur d'attaquer la première : fais attaquer player2 par player1 avec la méthode attacks.
#José ne va pas se laisser faire : fais l'attaque inverse.

def perform
	player1 = Player.new("Josiane") #À ma droite "Josiane" : crée un Player répondant à ce doux prénom et stocké dans la variable player1.
	player2 = Player.new("José") #À ma gauche "José" : crée un autre Player répondant à ce joli prénom et stocké dans la variable player2.
	player1.show_state # afficher l'état d'un joueur avec show_state
	player2.show_state

		# Allez, sur cette première étape je t'aide : il faut faire une boucle while. En effet, on ne sait pas combien de tours 
		# le combat va durer vu que les dommages sont aléatoires (il faut entre 2 et 10 coups pour venir à bout des 10 points de vie).

	while player2.life_points > 0 && player1.life_points > 0 do # -- ATTATION ERREUR a cause dy && le and ne passait pas ATTATION -- 
		puts "Passons à la phase d'attaaaaaaaaaaaaaaaque :"
		player1.attacks(player2)  # Player : attaquer avec attacks
		# Juste après l'attaque de Josiane (player1) sur José (player2), rajoute un petit if qui teste si player2 est mort 
		# (ses points de vie sont négatifs ou nuls). Si c'est le cas, il nous faut sortir immédiatement de la boucle while : c'est faisable grâce à la ligne break.
		if player2.life_points <= 0
			then break
		else
		player2.attacks(player1) if player2.life_points > 0 # si plus de points de vie, mort...
		end
		
	end
end

perform