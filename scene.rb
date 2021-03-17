class Scene
	@@scenes = {}
	@@current = nil

	class << self
		def add(director, title)
			@@scenes[title.to_sym] = director
		end

		def move_to(title)
			@@current = title.to_sym
		end

		def play
			@@scenes[@@current].play#directorクラス？のplayで良いよね？？
		end
	end
end