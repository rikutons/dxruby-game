require 'dxruby'

sprites = []
player = Sprite.new(0, 0, Image.new(10, 10).circle_fill(0, 0, 10, [50, 50, 255]))
Window.loop do
  player.draw
end