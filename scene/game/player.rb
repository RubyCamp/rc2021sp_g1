module Game
    class Player < Sprite
        ONE_SEC_FRAMES = 60
        def initialize(x, y, speed)
            @speed = speed

            @images = {
                waiting: Image.load_tiles("images/run.png", 6, 1),
                top: Image.load_tiles("images/air.png", 3, 1),
                bottom: Image.load_tiles("images/ground.png", 3, 1)
            }

            @state = :waiting
            super(x, y, @images[@state][0])

            # フレームの初期化
            @frame = 0

            @image_indexes = {
                waiting: 0,
                top: 0,
                bottom: 0
            }
            @original_y = y
        end

        def update
            if Input.key_push?(K_A) && !animating?
                @state = :bottom
            end

            if Input.key_push?(K_Q) && !animating?
                @state = :top
            end

            #p [:state, @state] ##テスト用
            animation
        end

        ##重国を通常時走らせるためにrunメソッド定義する？

        def animation
            @frame += 1

            if animating?
                case @state
                when :top, :bottom
                    self.y = @original_y - 200
                when :bottom
                end

                if @frame == 5
                    @frame = 0

                    if  @image_indexes[@state] == @images[@state].size
                        @state = :waiting
                        @image_indexes[@state] = 0

                        self.y = @original_y
                    end

                    self.image = @images[@state][@image_indexes[@state]]

                    if animating?
                        @image_indexes[@state] += 1
                    end
                end
            else
                self.image = @images[@state][@image_indexes[@state]]

                if @frame == 5
                    @frame = 0
                    @image_indexes[@state] += 1

                    if @image_indexes[@state] == @images[@state].size
                        @image_indexes[@state] = 0
                    end
                end
                p [@frame, @state, @image_indexes[@state]]
            end

            # p [:state, @state] if @state != :waiting
        end

        def animating?
            @state != :waiting
        end
    end
end