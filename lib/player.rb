require 'pry'

class Player
	attr_accessor :name ,:life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		if @life_points <= 0
			@life_points = 0
			"#{@name} a #{@life_points} points de vie"
		end
		"#{@name} a #{@life_points} points de vie"
	end

	def gets_damage(number_of_damage)
		@life_points = @life_points - number_of_damage
		if @life_points <= 0 then
			puts "#{@name} a été tué !"
			@life_points = 0
		end
	end

	def compute_damage
    	rand(1..6)
  	end

	def attacks(player_who_received_attacks)
		puts "#{name} attaque #{player_who_received_attacks.name}"
		damage_received = compute_damage
		puts "il lui inflige #{damage_received} points de dommages!!!"
		player_who_received_attacks.gets_damage(damage_received)
	end

end


class HumanPlayer < Player
	attr_accessor :weapon_level, :health_pack

	def initialize (name)
		@weapon_level = 1
		@health_pack = 1
		super(name)
		@life_points = 100
	end

	def search_weapon
		throw_dice_for_weapon = rand(1..6)
		if ( throw_dice_for_weapon > @weapon_level ) then
			@weapon_level = throw_dice_for_weapon
			if @weapon_level == 6
				puts "#{@name}, a présent vous possèdez l'arme le plus dangereux!!!!💣🔥💣🔥💣🔥💣🔥💣🔥💣🔥💣🔥💣🔥"
			end
			puts "Youhou ! elle est meilleure que ton arme actuelle, c'est un arme de niveau #{weapon_level}  : tu la prends"
		else
			puts "elle n'est pas mieux que votre arme actuelle : on ne la prend pas"
		end
	end

	def show_state
		if @life_points <= 0
			@life_points = 0
			"#{@name} a 0 points de vie"
		end
		"#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def search_health_pack
		throw_dice_for_health_pack = rand(1..6)
		@health_pack = throw_dice_for_health_pack
		if ( @health_pack == 1 ) then
			puts "Oh misère!!! il n'y a rien dedans!!😭😭🤕🤕"
		elsif ( @health_pack >= 2 && @health_pack <= 5) then
			puts "😍😍😍 Bravo!! t'as trouver un pack de +50 points de vie!!"
			@life_points = @life_points + 50
		else
			puts "😍😍😍🤑🤑🤑🤑 Waouh!! Jackpot!! +80 points de vie!!!"
			@life_points = @life_points + 80
		end

		if ( @life_points >= 100 )  then
			@life_points = 100
		end
		
	end

	def compute_damage
    	rand(1..6) * @weapon_level
  	end
end
#binding.pry
