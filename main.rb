require 'dxruby'

sprites = []
player = Sprite.new(0, 0, Image.new(10, 10).circle_fill(0, 0, 10, [50, 50, 255]))
sprites << player
start_font = Font.new(24)
while Input.key_push?(K_SPACE)
  Window.draw_font()
Window.loop do
  Sprite.update(sprites)
  Sprite.draw(sprites)
end