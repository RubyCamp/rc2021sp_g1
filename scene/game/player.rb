module Game
    class Player < Sprite
        ONE_SEC_FRAMES = 60

        attr_reader :state

        def initialize(x, y, speed)
            @speed = speed

            @images = Image.load_tiles("images/run.png", 6, 1)
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
                #@images = Image.load_tiles("(重国の地上アクション画像)", hoge, hoge)
            end

            if Input.key_push?(K_Q) && !animating?
                @state = :top
                #@images = Image.load_tiles("(重国の空中アクション画像)", hoge, hoge)
            end

            animation
        end

        ##重国を通常時走らせるためにrunメソッド定義する？

        def animation
            if animating?
                case @state
                when :top
                    self.y = @original_y - 200
                when :bottom
                end

                @frame += 1
                if @frame == 3
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

        def center_x
            self.x + (self.image.width / 2)
        end

        def animating?
            @state != :waiting
        end
    end
end