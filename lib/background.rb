class Background < Sprite
    ONE_SEC_FRAMES = 60
    def initialize(x, image_num, speed)

        @speed = speed
        # mainファイルで初期画像を指定
        @image_num = image_num

        image1 = Image.load("./image/image1.png")
        image2 = Image.load("./image/image2.png")

        @images = [image1, image2]

        super(x, y, @images[1])
        
        # 画像　フラグ用
        @flag = false

        # フレームの初期化
        @frame = 0
    end

    def update
        img = @images.shift
        @images << img

        self.image = @images[0]
        
        self.x -= @speed
    end
end