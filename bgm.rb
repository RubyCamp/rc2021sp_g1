class Bgm < Sound
   def initialize
        #bgm取り込み
       @bgm = Sound.new("image/game_bgm.mid")
   end
   def update
        #bgm流す
      @bgm.play
  end    
end