require_relative 'note'
require_relative 'player'
require_relative 'bgm'

module Game
    # シーン管理
    class Director
        def initialize#初期化
            @notes = []
            @player = Player.new(100, 400, 5)
            @music = Bgm.new()
        end

        def play#1フレーム描画
            #テスト機能：上下キー入力で音符の上下を生成
            if Input.key_push?(K_UP)
                @notes << Note.new("top")
            elsif Input.key_push?(K_DOWN)
                @notes << Note.new("bottom")
            end

            @music.update()

            @player.update()
            @player.draw()

            Sprite.update(@notes)
            Sprite.draw(@notes)
            Sprite.clean(@notes)
        end
    end

    def title_draw#タイトル文字列描画
        Window.draw_font(50, 5, "Sample Game")
    end
end