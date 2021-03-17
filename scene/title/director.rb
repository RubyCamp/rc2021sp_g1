#require_relative 'title'

module Title
    class Director
        def play
            Window.draw_font(100, 100, "Push space to start.", font)
        end
    end
end
