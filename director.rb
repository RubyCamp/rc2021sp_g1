module Game
    # シーン管理
    class Director
        def initialize#初期化
            @notes = []
        end

        def play#1フレーム描画
            #テスト機能：上下キー入力で音符の上下を生成
            if Input.key_push?(K_UP)
                @notes << Note.new("top")
            elsif Input.key_push?(K_DOWN)
                @notes << Note.new("bottom")
            end

            Sprite.update(@notes)
            Sprite.clean(@notes)
            Sprite.draw(@notes)
        end
    end

    def title_draw#タイトル文字列描画
        Window.draw_font(50, 5, "Sample Game")
    end
end