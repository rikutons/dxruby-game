class Player < Sprite
  def initialize(x, y)
    self.image = Image.new(20, 20).circle_fill(10, 10, 10, [0, 229, 255])
    self.x = x
    self.y = y
    @hit = false
    @enemy = []
  end

  def set_enemies(enemy)
    @enemy = enemy
  end

  def add_enemy(enemy)
    @enemy << enemy
  end

  def update
    if self === @enemy
      @hit = true
    end
  end

  def hit?
    @hit
  end
end