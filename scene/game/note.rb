module Game
    class Note < Sprite
        attr_reader :score, :dt
        def initialize(pos, dt)
            self.x = 800
            @score = 0
            @dt = dt

            #音符描画位置
            if pos == "top"
                self.y = 200
                self.image = Image.load("images/note_symbol_top.png")
            elsif pos == "bottom"
                self.y = 400
                self.image = Image.load("images/note_symbol_bottom.png")
            end

            #サウンドエフェクト
            @great_se = Sound.new("music/great.wav")
            @great_se.set_volume(220)
            @good_se = Sound.new("music/good.wav")
            @good_se.set_volume(220)
            @bad_se = Sound.new("music/bad.wav")
            @bad_se.set_volume(220)

            @judged = false
        end

        def update
            if self.x < -200
                vanish#音符のオブジェクトが左端いったら描画されなくなる感じ
            end
            self.x -= 5
        end

        def center_x
            self.x + (self.image.width / 2)
        end

        def assessor(aim)
            if (self.center_x - aim.center_x).abs < 15
                @score = 1000
                @great_se.play
            elsif (self.center_x - aim.center_x).abs < 30
                @score = 500
                @good_se.play
            else
                @score = 100
                @bad_se.play
            end
            @judged = true
        end

        def hit(o)
            if !@judged
                case o.pos
                when :top
                    if Input.key_push?(K_Q)
                        print "hit top"
                        assessor(o)
                    end
                when :bottom
                    if Input.key_push?(K_A)
                        print "hit bottom"
                        assessor(o)
                    end
                end
            end
        end
        
    end
end