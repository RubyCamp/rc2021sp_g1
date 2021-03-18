require 'dxruby'
require 'singleton'

require_relative 'scene/scene'
require_relative 'scene/game/director'
require_relative 'scene/result/director'
#タイトル画面関連のファイルの読み込み
#リザルト画面関連のファイルの読み込み

Window.width = 800
Window.height = 600

#Scene.addでタイトル画面　Scene.add(（なんちゃらクラス）, :title)
#Scene.addでリザルト画面　Scene.add(（かんちゃらクラス）, :result)
Scene.add(Result::Director.new, :result)
Scene.add(Game::Director.new, :game)
Scene.move_to(:game)#最初に画面出すのはタイトルなので最終的には:titleになります

Window.loop do
    break if Input.key_push?(K_ESCAPE)#escキーはタイトルに戻るとかでもいいかも
    
    Scene.play
end