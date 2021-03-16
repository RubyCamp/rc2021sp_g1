require "dxruby"
require_relative "./lib/player"

Window.width = 800
Window.height = 600
Window.caption = "キャラクター表示"

image = Image.load("./image/car.png")
# 画像の背景を透明に
image.set_color_key(C_WHITE)

player = Player.new(100, 100, image, 5)

Window.loop do
    # escキーを押すと、ループを抜ける処理
    break if Input.key_push?(K_ESCAPE)

    player.update()
    player.draw()
end
