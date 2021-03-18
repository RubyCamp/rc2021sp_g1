require "dxruby"

require_relative "./scene/game/score"
require_relative "./scene/game/result"

Window.width = 800
Window.height = 600

score = Game::Score.new(true)
result_point = score.update()
result = Game::Result.new(result_point)

Window.loop do
    result.draw()
    result.update()
    result.draw_result()
end