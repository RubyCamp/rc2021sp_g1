module Game
    class Aim < Sprite
        attr_reader :pos

        def initialize(x, y, pos)
            @aim_image = Image.load("images/aim_image.png")

            @pos = pos

            super(x, y, @aim_image)
        end

        def center_x
            self.x + (self.image.width / 2)
        end

        def update
        end
    end
end