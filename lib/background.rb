class Background < Sprite
    ONE_SEC_FRAMES = 60
    def initialize(x, image_num, speed)

        @speed = speed
        # mainファイルで初期画像を指定
        @image_num = image_num

        image1 = Image.load("./image/image1.png")
        image2 = Image.load("./image/image2.png")

        @images = [image1, image2]
        @image_num = @images.size

        super(x, y, @images[0])
        
        # 画像　フラグ用
        @flag = false

        # フレームの初期化
        @frame = 0
    end

    def update
        @frame += 1
        if @frame == ONE_SEC_FRAMES * 5
            @frame = 0
            img = @images.shift
            @images << img

            self.image = @images[0]
        end

        self.x -= @speed
    end
end