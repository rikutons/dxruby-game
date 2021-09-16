require 'dxruby'
require_relative 'manager'
require_relative 'heart'
require_relative 'bar'
require_relative 'mario'
require_relative 'toho'

GAME_COUNT = 2
$title_font = Font.new(24)

def wait_start
  Window.loop do
    Window.draw_font(160,200, "スペースキーを押してスタート", $title_font)
    break if Input.key_push?(K_SPACE)
  end
end

def new_game(manager, game, sprites, diff)
  if !game.nil?
    game.free
    game.vanish
  end
  game_num = rand(GAME_COUNT)
  if game_num == 0
    game = Mario.new(sprites, diff)
  end
  if game_num == 1
    game = Toho.new(sprites, diff)
  end
  sprites << game
  manager.set_game(game)
  return game
end

wait_start

sprites = []
manager = Manager.new
sprites << manager

4.times do |i|
  heart = Heart.new(manager, i)
  sprites << heart
end
sprites << Bar.new(manager)

game = nil
game = new_game(manager, game, sprites, 1)

Window.loop do
  if game.game_over?
    manager.damage
    game = new_game(manager, game, sprites, manager.get_diff)
  elsif game.clear?
    manager.add_score
    game = new_game(manager, game, sprites, manager.get_diff)
  end
  if !manager.game_over?
    Sprite.update(sprites)
  end
  Sprite.draw(sprites)
  Sprite.clean(sprites)
end
