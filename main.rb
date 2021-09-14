require 'dxruby'

require_relative 'player'
require_relative 'enemy'

player_img = Image.load("image/player.png")
x = 100
y = 100
player = Player.new(x, y, player_img)

enemy_img = Image.load("image/enemy.png")
x = 300
y = 300
enemy = Enemy.new(x, y, enemy_img)

Window.loop do
  player.update
  player.draw

  enemy.draw

  Sprite.check(player, enemy)
end