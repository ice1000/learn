require_relative '../src/engine'

class AssWeCan < Game
	def on_last_init
		r = ImageResource.from_file '5.gif'
		@a = ImageObject.new r, 100, 100
		@a.add_anim SimpleMove.new(5, 5)
		add_object @a
	end
	# def on_refresh
		# p @a.x, @a.y
	# end
end

AssWeCan.new
# loop do
# 	p Clock.current
# end
