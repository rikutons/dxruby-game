class Manager < Sprite
    def initialize
        @score_font = Font.new(16)
        @life = 3
        @game = nil
        @score = 0
        @is_game_over = false
    end

    def set_game(game)
        @game = game
    end

    def draw
        Window.draw_font(620, 0, @score.to_s, @score_font)
        if @is_game_over
            game_over
            @game.game_over
        end
    end

    def get_bar_progress
        @game.get_bar_progress
    end

    def get_life
        @life
    end

    def add_score
        @score += 1
    end

    def damage
        @life -= 1 if @life > -1
        @is_game_over = @life == -1
    end

    def get_diff
        @score + 1
    end
    
    def game_over
        sp = Sprite.new(200, 200, Image.new(300, 300, [0,0,0]))
        sp.draw
        gameover_font = Font.new(32)
        Window.draw_font(230, 220, "ゲームオーバー！", gameover_font)
    end

    def game_over?
        @is_game_over
    end
end