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
                Note.new("top", 3),
                Note.new("bottom", 6),
                Note.new("top", 7),
                Note.new("bottom", 8),
                Note.new("top", 3),
                Note.new("bottom", 6),
                Note.new("top", 7),
                Note.new("bottom", 8)
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

            if @count > (20 * 60)
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