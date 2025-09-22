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
    @x += @vel_x + Gosu.offset_x(@angle, 5)
    @y += @vel_y + Gosu.offset_y(@angle, 5)
    
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle, 1, 1, 4.0, 4.0)
  end

end