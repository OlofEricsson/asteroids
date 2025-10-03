class Bullet

  def initialize(startx, starty, startvelx, startvely, startangle)  
    @image = Gosu::Image.new("media/Bullet.png", :retro => true)
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
    @image.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, 5, 5)
  end

  def off_screen?(window_width, window_height)
    @x < 0 || @x > window_width || @y < 0 || @y > window_height
  end

end
