require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Toky")
player2 = Player.new("King Law")

while player1.life_points > 0 && player2.life_points > 0
	
	puts "Voici l'etat de chaque joueur :"
	puts "statistique de #{player1.name}"
	puts player1.show_state
	puts
	puts "statistique de #{player2.name}"
	puts player2.show_state
	puts
	if ( player1.life_points == 10 && player2.life_points == 10 ) then
		puts "Passons à la phase d'attaque!!!!!!! "
		puts "FIIIIIIIGGGGHHHHHTTTT !!!!!!!!"
	end
	player2.attacks(player1)
	puts
	if ( player1.life_points <= 0 || player2.life_points <= 0 ) then
		break
	end
	player1.attacks(player2)
	puts
	puts
end



#binding.pry