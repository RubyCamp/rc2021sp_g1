module Game
    class Player < Sprite
        ONE_SEC_FRAMES = 60
        def initialize(x, y, speed)
            @speed = speed

            @images = Image.load_tiles("images/KGRN5187.png", 6, 1)
            self.scale_x = 1.5
            self.scale_y = 1.5

            super(x, y, @images[0])

            # フレームの初期化
            @frame = 0

            @image_index = 0
            @original_y = y

            @state = :waiting
        end

        def update
            if Input.key_push?(K_A) && !animating?
                @state = :bottom
            end

            if Input.key_push?(K_Q) && !animating?
                @state = :top
            end
            p [:state, @state] ##テスト用
            animation
        end

        def animation
            if animating?
                case @state
                when :top
                    self.y = @original_y - 200
                when :bottom
                end

                @frame += 1
                if @frame == 5
                    @frame = 0

                    if @image_index == @images.size
                        @state = :waiting
                        @image_index = 0

                        self.y = @original_y
                    end

                    self.image = @images[@image_index]

                    if animating?
                        @image_index += 1
                    end
                end
            end
        end

        def animating?
            @state != :waiting
        end
    end
end