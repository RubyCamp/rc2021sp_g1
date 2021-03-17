module Game
    class Note < Sprite
        def initialize(pos)
            self.x = 800

            #音符描画位置
            if pos == "top"
                self.y = 200
                self.image = Image.load("images/note_symbol_top.png")
            elsif pos == "bottom"
                self.y = 400
                self.image = Image.load("images/note_symbol_bottom.png")
            end
        end

        def update
            if self.x < -200
                vanish#音符のオブジェクトが左端いったら描画されなくなる感じ
            end
            self.x -= 5
        end
    end
end