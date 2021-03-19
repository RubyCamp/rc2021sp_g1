module Game
    class Bgm
        def initialize
            #bgm取り込み
            @music = Sound.new("music/game_bgm.wav")
            @music.set_volume(150)
            @state = :paused
        end

        def update
            #bgm流す
            if music_playing?
                case @state
                when :paused#曲流れてなかったら
                    @music.play
                    @state = :playing
                when :playing#曲流れてるなら
                end
            end
        end

        def music_playing?
            @state != :playing
        end
    end
end
