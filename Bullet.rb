class Bullet

  def initialize(startx, starty, startvelx, startvely, startangle)  
    @image = Gosu::Image.new("media/Bullet.png")
    @x = startx
    @y = starty
    @vel_x = startvelx
    @vel_y = startvely
    @angle = startangle
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1200
    @y %= 800
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle, 1, 1, 1.0, 1.0)
  end

end