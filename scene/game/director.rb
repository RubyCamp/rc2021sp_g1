require_relative 'note'
require_relative 'player'
require_relative 'bgm'
require_relative 'background'
require_relative 'aim'

module Game
    # シーン管理
    class Director
        def initialize#初期化
            @background = Background.new(2)#背景画像
            @notes = []#音符
            @player = Player.new(100, 400, 5)
            @music = Bgm.new()
            @aim1 = Aim.new(300, 200, :top)
            @aim2 = Aim.new(300, 400, :bottom)

            @count = 0

            @all_notes = [
                Note.new("top", 2.25),
                Note.new("top", 2.7),
                Note.new("top", 3.16),
                Note.new("bottom", 3.95),
                Note.new("top", 4.87),
                Note.new("bottom", 5.75),
                Note.new("top", 6.65),
                Note.new("bottom", 7.6),
                Note.new("top", 8.5),
                Note.new("bottom", 9.4),
                Note.new("bottom", 10.3),
                Note.new("top", 11.2),
                Note.new("top", 12.1),
                Note.new("bottom", 13),
                Note.new("top", 13.8),
                Note.new("bottom", 14.7),
                Note.new("top", 15.6),
                Note.new("top", 16.45),
                Note.new("bottom", 17.3),
                Note.new("top", 18.15),
                Note.new("bottom", 19),
                Note.new("top", 19.85),
                Note.new("top", 20.7),
                Note.new("bottom", 21.55),
                Note.new("top", 22.4),
                Note.new("bottom", 23.25),
                Note.new("bottom", 24.1),
                Note.new("top", 24.95),
                Note.new("top", 25.8),
                Note.new("top", 26.65),
                Note.new("bottom", 27.5),
                Note.new("bottom", 28.35),
                Note.new("top", 29.2),
                Note.new("bottom", 30.05),
                Note.new("top", 30.9),
                Note.new("bottom", 31.75),
                Note.new("top", 32.6),
                Note.new("top", 33.45),
                Note.new("bottom", 34.3),
                Note.new("top", 35.15),
                Note.new("top", 36),
                Note.new("bottom", 36.85),
                Note.new("top", 37.7),
                Note.new("bottom", 38.55),
                Note.new("top", 39.4),
                Note.new("bottom", 40.25),
                Note.new("bottom", 41.1),
                Note.new("top", 41.95),
                Note.new("top", 42.8),
                Note.new("bottom", 43.65),
                Note.new("bottom", 44.5),
                Note.new("top", 45.35),
                Note.new("top", 46.2),
                Note.new("top", 47.05),
                Note.new("bottom", 47.9)
            ]

            @notes = []
        end

        def reload
            @start = Time.now()
        end

        def refresh_notes
            now = Time.now()
            dt = now - @start
            @notes = @all_notes.select{|note| note.dt < dt }
        end

        def play#1フレーム描画
            #テスト機能：上下キー入力で音符の上下を生成
            # if Input.key_push?(K_UP)
            #     @notes << Note.new("top")
            # elsif Input.key_push?(K_DOWN)
            #     @notes << Note.new("bottom")
            # end

            @background.update()
            @music.update()
            @player.update()
            refresh_notes
            Sprite.update(@notes)

            Sprite.check(@aim1, @notes)
            Sprite.check(@aim2, @notes)

            if @count > (50 * 60)
                sum = @all_notes.inject(0) {|sum, note| sum + note.score }
                Scene.set(:total_score, sum)
                Scene.move_to(:result)
            end

            @background.draw()
            @player.draw()
            @aim1.draw
            @aim2.draw
            Sprite.draw(@notes)

            Sprite.clean(@notes)

            @count += 1
        end
    end

    def reload
    end

    # def gameover
    #     #ゲームオーバーの条件
    #     @count > (30 * 60)
    # end

    def title_draw#タイトル文字列描画
        Window.draw_font(50, 5, "Sample Game")
    end
end