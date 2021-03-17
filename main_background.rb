require "dxruby"
require_relative "./lib/background"

Window.width = 800
Window.height = 600

background = Background.new(0, 0, 2)

Window.loop do
    background.update()
    background.draw()
end