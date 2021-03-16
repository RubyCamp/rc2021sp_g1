    class Note < Sprite
        def initialize(x, y, image)
            self.x = x
            self.y = y
            self.image = Image.load(image)
        end

        def update
            self.x -= 5
        end
    end