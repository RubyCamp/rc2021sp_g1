require 'dxruby'
require 'singleton'

require_relative 'scene/scene'

#require_relative 'director_base' 多分要らん気がする
require_relative 'scene/game/director'

Window.width = 800
Window.height = 600

Scene.add(Game::Director.new, :game)
Scene.move_to(:game)

Window.loop do
    break if Input.key_push?(K_ESCAPE)
    Scene.play
end