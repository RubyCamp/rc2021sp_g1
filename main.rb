require 'dxruby'
require 'singleton'

require_relative "./lib/player"
require_relative 'scene'
require_relative 'rythm'
#require_relative 'player' #←池田班のモジュール

#require_relative 'director_base' 多分要らん気がする
require_relative 'director'

Window.width = 800
Window.height = 600



Scene.add(Game::Director.new, :game)
Scene.move_to(:game)
player = Player.new(100, 100, 5)


Window.loop do
    break if Input.key_push?(K_ESCAPE)
    Scene.play
    player.update()
    player.draw()
end

###############################################


# Window.loop do
#     # escキーを押すと、ループを抜ける処理
#     break if Input.key_push?(K_ESCAPE)

#     # ↑キーを実行するとアニメーションが変わる
    
# end