require 'dxruby'
class GameBase < Sprite
    @@main_font = Font.new(32)
    @@sub_font = Font.new(16)
    def initialize(limit_time, main_text, sub_text)
        @limit_time = limit_time
        @time = limit_time 
        @main_text = main_text
        @sub_text = sub_text
        @is_game_over = false
        @is_game_clear = false
        @objects = []
        @hit = false
        @game_over = false
    end

    def update
        @time -= 1 if @time > 0
        if @hit
            @is_game_over = true
        elsif @time == 0
            @is_game_clear = true
        end
    end

    def game_over
        @game_over = true
    end

    def draw
        if(@limit_time - @time < 60 && !@game_over)
            Window.draw_font(260, 200, @main_text, @@main_font)
        end
        Window.draw_font(0, 460, @sub_text, @@sub_font)
    end

    def free
        @objects.each do |o|
            o.vanish
        end
    end

    def get_bar_progress
        1.0 * @time / @limit_time
    end

    def clear?
        @is_game_clear
    end

    def game_over?
        @is_game_over
    end
end