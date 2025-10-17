class Asteroid

  attr_reader(:x, :y, :width, :height)


  def initialize(game_window)
    @game_window = game_window
    @image = Gosu::Image.new("media/Asteroid.png", :retro => true)
    @x = rand((0 + @image.width)..(1199 - @image.width))
    @y = rand((0 + @image.width)..(799 - @image.height))
    @vel_x = 0.0
    @vel_y = 0.0
    @angle = rand(0..359)
    @width = @image.width
    @height = @image.height
  end

  def left
    @x
  end

  def right
    @x + @width
  end

  def bottom
    @y + @height
  end


  def hit_by(object)
    if object.class == Bullet
      @grillkorv = true
    end

  end

  def move
    @x += Gosu.offset_x(@angle, 0.5)
    @y += Gosu.offset_y(@angle, 0.5)
    @x %= 1200
    @y %= 800
  end

  def draw
    Gosu.draw_rect(@x - @width, @y - @height, @width*2, @height*2, Gosu::Color.argb(0xff_808080))
    @image.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, 2.0, 2.0)
  end

end