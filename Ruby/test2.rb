require_relative '../src/engine'

class Shit < Game
	def on_init
		size 300, 300
		@ass_we_can = FTimer.new 1000
		@boy_next_door = 10
	end
	def on_refresh
		if @ass_we_can.ended
			add_object FLine.new(@boy_next_door, 10, 200 + @boy_next_door, 200)
			@boy_next_door += 10
		end
	end
end

Shit.new
