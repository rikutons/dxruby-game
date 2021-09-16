require 'dxruby'
require_relative 'game_base'
require_relative 'player'
require_relative 'enemy'
class Mario < GameBase
    def initialize(sprites, diff)
        super(300, "逃げろ!", "矢印:横移動 スペース:ジャンプ, シフト:ダッシュ")
        @player = MarioPlayer.new()
        @sprites = sprites
        @objects << @player
        sprites << @player
        ground = Sprite.new(0, 400, Image.new(640, 60, [0, 255, 34]))
        @objects << ground
        sprites << ground
        @diff = diff
        10.times do |i|
            enemy = Enemy.new(rand(40..600), rand(40..180), rand(-5..5), rand(1..5))
            sprites << enemy
            @objects << enemy
            @player.add_enemy(enemy)
        end
    end

    def update
        super
        if(@time % (60 / @diff) == 0)
            enemy = Enemy.new(rand(40..600), rand(40..180), rand(-5..5), rand(1..5))
            @sprites << enemy
            @objects << enemy
            @player.add_enemy(enemy)
        end
        if(@time % (600 / @diff) == 0)
            enemy = Enemy.new(-20, 383, rand(2..5), 0)
            @sprites << enemy
            @objects << enemy
            @player.add_enemy(enemy)
        end
        if(@time % (600 / @diff) == 300 / @diff)
            enemy = Enemy.new(640, 383, rand(-5..-2), 0)
            @sprites << enemy
            @objects << enemy
            @player.add_enemy(enemy)
        end
        @hit = @player.hit?
    end

    def draw
        super
    end
end

class MarioPlayer < Player
    def initialize
        super(320, 320)
        @velocity = 0
    end
    def update
        super
        if(Input.key_down?(K_LSHIFT))
            self.x += Input.x * 5
        else
            self.x += Input.x * 1
        end
        self.x = 0 if self.x < 0
        self.x = 620 if self.x > 620
        if(self.y == 380 && Input.key_push?(K_SPACE))
            @velocity = -39.6
        end
        self.y += @velocity
        if(self.y < 380)
            @velocity += 4.9
        else
            @velocity = 0
        end
        self.y = 380 if self.y > 380
    end
end