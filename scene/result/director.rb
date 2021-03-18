require_relative 'result'

module Result
    class Director
        def initialize#初期化
        end

        def play#1フレーム描画
            #テスト機能：上下キー入力で音符の上下を生成
            # p @score

            @result.draw()
            @result.update()
            @result.draw_result()
        end

        def reload
            @score = Scene.get(:total_score)
            @result = Result.new(@score)
        end
    end
end