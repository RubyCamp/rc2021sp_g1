class Scene
	@@scenes = {}
	@@current = nil
	@@variables = {}

	class << self
		def add(director, title)
			@@scenes[title.to_sym] = director
		end

		def move_to(title)
			@@current = title.to_sym
			director = @@scenes[@@current]
			director.reload if director.respond_to? :reload
		end

		def set(key, value)
			@@variables[key] = value
			p @@variables
		end

		def get(key)
			p [:get, :key, @@variables]
			@@variables[key]
		end

		def play
			@@scenes[@@current].play#directorクラス？のplayで良いよね？？
		end
	end
end