require 'dxruby'
class Bar < Sprite
    def initialize(manager)
        @manager = manager
        self.x = 120
        self.y = 3
        self.image = Image.new(480, 14, [255, 0, 0])
    end

    def update
        length = @manager.get_bar_progress
        if length != 0
            self.image = self.image.clear.box_fill(0, 0, 500 * length, 14, [255, 0, 0])
        else
            self.image = self.image.clear
        end
    end
end