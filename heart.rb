require 'dxruby'

class Heart < Sprite
    @@image = Image.load("images/heart_20w.png").flush([255, 0, 140])
    def initialize(manager, id)
        @manager = manager
        @id = id
        @on = true

        self.x = 0 + 25 * id
        self.y = 0
        self.image = @@image
    end

    def update
        if @manager.get_life < @id && @on
            self.image = self.image.flush([69, 69, 69])
            @on = false
        elsif @manager.get_life >= @id && !@on
            self.image = self.image.flush([255, 0, 140])
            @on = true
        end
    end
end