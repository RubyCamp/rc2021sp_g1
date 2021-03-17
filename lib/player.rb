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

        @image_index = 0
        
    end

    def update
        @flag = true if Input.key_push?(K_SPACE) && !@flag
        if @flag
            @frame += 1
            if @frame == 5
                @frame = 0
                # img = @images.shift
                # @images << img
                if @image_index == @images.size
                    @flag = false
                    @image_index = 0
                end
                self.image = @images[@image_index]
                @image_index += 1 if @flag
            end
        end

        # self.x += Input.x * @speed
        # self.y += Input.y * @speed
    end
end