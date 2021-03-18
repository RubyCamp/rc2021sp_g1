module Game
    class Score
        def initialize(attack_flag)
            @score_point = 0

            # true か falseで当たり判定を受け取る
            @attack_flag = attack_flag

            # good = 1, great = 2
            #@point_type = point_type
        end

        def update
            return @score_point += 1 if @attack_flag
        end
    end
end