require 'dxruby'

sprites = []
player = Sprite.new(0, 0, Image.circle_fill(0, 0, 10, [0, 255, 0]))
Window.loop do
  player.draw
end