require "dxruby"
require_relative "./lib/player"

Window.width = 800
Window.height = 600
Window.caption = "キャラクター表示"

player = Player.new(100, 100, 5)

Window.loop do
    # escキーを押すと、ループを抜ける処理
    break if Input.key_push?(K_ESCAPE)

    # ↑キーを実行するとアニメーションが変わる
    player.update()
    player.draw()
end
