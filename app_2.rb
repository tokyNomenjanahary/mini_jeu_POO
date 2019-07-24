require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "============================================================"
puts "              BIENVENUE DANS FORTNITE VERSION 2.0.0         "
puts "                       LE BUT DU JEUX                       "
puts " 1) POUR GAGNER VOUS DEVRIEZ RESTER DEBOUT DURANT LE COMBAT "
puts " 2) LE DERNIER COMBATTANT DEBOUT REMPORTE LA COMPÉTITION    "
puts "============================================================"

puts "APPUYEZ SUR UNE TOUCHE POUR JOUER"
print "==>"
play = gets.chomp

puts "Créer votre profil !"
puts "entrez votre nom de combattant"
print "==>"
profil = gets.chomp

player1 = HumanPlayer.new(profil)
array_ennemies =[ player2 = Player.new("José"), player3 = Player.new("Josiane")]

while (( player2.life_points > 0 || player3.life_points > 0 ) && (player1.life_points > 0 ))
	
	puts "Voici l'etat de chaque joueur :"
	puts "statistique de #{player1.name}"
	puts player1.show_state
	puts 
	puts "votre ennemies!"
	if player2.life_points <= 0
		life_state_2 = false
		puts "#{player2.name} est mort!"
	elsif player3.life_points <= 0
		life_state_3 = false
		puts "#{player3.name} est mort!"
	end
	if player2.life_points > 0
		puts player2.show_state
	end
	if player3.life_points > 0
		puts player3.show_state
	end

	puts

		action = 5
	loop {
			puts "Quelle action veux-tu effectuer ????"
			puts "a) - chercher une meilleure arme"
			puts "s) - chercher à se soigner "
			puts "p) - passer et ne rien faire!!"
			puts " a ou s ou p : Indiquer votre reponse"
			print "==>"
			action = gets.chomp
		break if action == "a" || action == "s" || action == "p"
	}

	if ( action == "a" ) then
		player1.search_weapon
	elsif ( action == "s") then
		player1.search_health_pack
	end


	puts "attaquer un joueur en vue :"
	puts 
	if life_state_2 == false
		puts "vous ne pouvez plus attaquer #{player2.name} !!, il est mort!"
	elsif life_state_3 == false
		puts "vous ne pouvez plus attaquer #{player3.name} !!, il est mort!"
	end
	attaque = ""
	loop {
			puts "0) - Josiane a #{player3.life_points} points de vie"
			puts "1) - José a #{player2.life_points} points de vie"
			puts "3) - pour rester en retrait"
			print "==>"
			attaque = gets.chomp
			puts ""
			puts ""
		break if attaque == "0" || attaque == "1" || attaque == "3"
	}

	if ( player1.life_points == 100 && player2.life_points == 10  && player3.life_points == 10 ) then
		puts "Passons à la phase d'attaque!!!!!!! "
		puts "FIIIIIIIGGGGHHHHHTTTT !!!!!!!!"

	end



	if ( attaque == "0" ) then
		 player1.attacks(player3)
	elsif ( attaque == "1" ) then
		 player1.attacks(player2)
	elsif ( attaque == "3" )
		puts "Qu'est vous faite!!😱😱😱😱😱😱😱"
		puts 
		puts "Reprenez vous!! ils attaquent !!!!!😵😵😵😵😵😵😵"
	else
		puts 
	end

	if ( player3.life_points > 0 && player2.life_points > 0 )
		puts "Les autres joueur t'attaque!!!"
	end



	array_ennemies.each do |ennemies_attacks|
		next if ennemies_attacks.life_points <= 0
		ennemies_attacks.attacks(player1)
	end

end
 if player1.life_points > 0 then
 	state = "💪💪💪💪💪💪 FELECITATION VOUS ETES LE MEILLEUR 💪💪💪💪💪💪💪 "
 else
 	state = "😱😭😦😭😦 COURAGE MON AMI(E) T'AS FAIT DE TON MIEUX 😭😦😭😦😱"
 end

puts "==============================================================="
puts "                         FIN DU JEUX                          "
puts "                         #{profil}                          "
puts "#{state}"
puts "==============================================================="
