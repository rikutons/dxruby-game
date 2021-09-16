require 'dxruby'
require_relative 'game_base'
require_relative 'player'
require_relative 'enemy'
class Toho < GameBase
    def initialize(sprites, diff)
        super(500, "避けろ!", "矢印:移動 シフト:加速")
        @player = TohoPlayer.new()
        @sprites = sprites
        @objects << @player
        sprites << @player
        ground = Sprite.new(0, 400, Image.new(640, 60, [0, 255, 34]))
        @diff = diff
    end

    def update
        super
        if(@time % 60 == 0)
            d = (@time / 60 * 3) / 180.0 * Math::PI
            8.times do |i|
                enemy = Enemy.new(320, 120, Math::cos(2 * Math::PI / 8 * i + d) * 1.5,
                 Math::sin(2 * Math::PI / 8 * i + d) * 1.5)
                @sprites << enemy
                @objects << enemy
                @player.add_enemy(enemy)
            end
        end
        if(@time % 60 == 30)
            d = (@time / 60 * 20) / 180.0 * Math::PI
            k = 1 + @diff
            k.times do |i|
                enemy = Enemy.new(320, 120, Math::cos(2 * Math::PI / k * i + d) * 3,
                 Math::sin(2 * Math::PI / k * i + d) * 3)
                @sprites << enemy
                @objects << enemy
                @player.add_enemy(enemy)
            end
        end
        if(@time % (60 / @diff) == 0)
            d = (@time / (60 / @diff)  * 3) / 180.0 * Math::PI
            4.times do |i|
                enemy = Enemy.new(320, 120, Math::cos(2 * Math::PI / 4 * i + d) * 1.5,
                 Math::sin(2 * Math::PI / 4 * i + d) * 1.5)
                @sprites << enemy
                @objects << enemy
                @player.add_enemy(enemy)
            end
        end
        @hit = @player.hit?
    end

    def draw
        super
    end
end

class TohoPlayer < Player
    def initialize
        super(320, 320)
        @velocity = 0
    end
    def update
        super
        if(Input.key_down?(K_LSHIFT))
            self.x += Input.x * 5
            self.y += Input.y * 5
        else
            self.x += Input.x * 1
            self.y += Input.y * 1
        end
    end
end