class Player < Sprite
    ONE_SEC_FRAMES = 60
    def initialize(x, y, speed)

        @speed = speed

        image1 = Image.load("image/hyoujou1.png")
        image2 = Image.load("image/hyoujou2.png")
        image3 = Image.load("image/hyoujou3.png")
        image4 = Image.load("image/hyoujou4.png")
        @images = [image1, image2, image3, image4]

        super(x, y, @images[0])

        # 画像 フラグ 用
        @flag = false

        # フレームの初期化
        @frame = 0
        
    end

    def update
        @flag = !@flag if Input.key_push?(K_UP)
        if @flag
            @frame += 1
            if @frame == ONE_SEC_FRAMES * 2
                @frame = 0
                img = @images.shift
                @images << img

                self.image = @images[0]
            end
        end

        self.x += Input.x * @speed
        self.y += Input.y * @speed
    end
end