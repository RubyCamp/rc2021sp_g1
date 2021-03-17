class DirectorBase < Sprite
# Sceneクラスから、move_toによるシーン切り替え時に自動的に呼び出されるメソッド
    def reload
        raise "継承先で必ずオーバーライドしてください。"
    end

    # 1フレーム分の描画処理
    def play
        raise "継承先で必ずオーバーライドしてください。"
    end
end