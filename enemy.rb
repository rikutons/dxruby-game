class Enemy < Sprite
  def initialize(x = 0, y = 0, vx = 0, vy = 0)
    self.image = Image.new(20, 17).triangle_fill(10, 0, 0, 17, 20, 17, [255, 0, 0])
    self.x = x
    self.y = y
    @vx = vx
    @vy = vy
  end

  def update
    self.x += @vx
    self.y += @vy
  end
  def hit
    self.vanish
  end
end