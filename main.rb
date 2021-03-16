require 'dxruby'
require_relative 'rythm'
##require_relative 'director'

Window.width = 800
Window.height = 600

note_symbol_up = Note.new(800, 200, "note_symbol_up.png")
note_symbol_down = Note.new(800, 400, "note_symbol_down.png")

Window.loop do
    note_symbol_up.update
    note_symbol_down.update
    note_symbol_up.draw
    note_symbol_down.draw
end