require "dxruby"

Window.height = 600
Window.width = 800

SCORE = "790000"



class Result
    
    def draw_result
        font1 = Font.new(43)#dai/2 han
        font2 = Font.new(100)
        font3 = Font.new(24)

        s_size = SCORE.size
        s = 50*(s_size/2)

        
        # Window.draw_box_fill(0,0,800,600,[230,255,255]z=0)
        Window.draw_font(335,100,"Result!",font1)
        Window.draw_font(400-s,250,"#{SCORE}",font2)
        Window.draw_font(270,500,"Press 'Space' to Restart!",font3)

    end
    ONE_SEC_FRAMES = 60
    def initialize()
        @image = Image.load("images/background_image.png")

        @speed = 5
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


result = Result.new()

Window.loop do

    result.draw
    result.update
    result.draw_result
end