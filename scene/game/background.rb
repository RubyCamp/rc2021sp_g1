module Game
    class Background
        ONE_SEC_FRAMES = 60
        def initialize(speed)
            @image = Image.load("images/background_image.png")

            @speed = speed
            @map_x = 0
        end

        def update
            # 座標計算
            @map_x -= @speed

            # 1つ目のimageの端まで来たら
            if @image.width + @map_x <= @speed
                # 表示するx座標に@image.widthを足す
                @map_x += @image.width
            end
        end

        def draw
            # 計算したx座標をもとに画像を表示する
            Window.draw(@map_x, 0, @image)
            Window.draw(@image.width + @map_x, 0, @image)
        end
    end
end