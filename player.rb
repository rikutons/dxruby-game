class Player < Sprite
  def update
    self.x += Input.x
    self.y += Input.y
  end
end