class Spaceship

  attr_reader :x, :y


  def initialize(game_window)
    @game_window = game_window
    @image = Gosu::Image.new("media/Spaceship_default.png", :retro => true)
    @shoot = Gosu::Sample.new("media/rocket-launch.mp3")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
    @cooldown_time = 200
    @last_shot = 0 
  end

  def warp(x, y)
    @x = x  - @image.width / 2
    @y = y  - @image.height / 2
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def accelerate #offset används för att beräkna förflyttningen av player, vinkeln, pixels/frame
    @vel_x += Gosu.offset_x(@angle, 0.5)
    @vel_y += Gosu.offset_y(@angle, 0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1200
    @y %= 800

    @vel_x *= 0.98
    @vel_y *= 0.98
  end

  def shoot
    now = Gosu.milliseconds
    if now - @last_shot >= @cooldown_time
      @last_shot = now
      @game_window.bullets << Bullet.new(@x, @y, @vel_x, @vel_y, @angle)
      @shoot.play
    end
  end

  def vel_x
    return @vel_x
  end
  def vel_y
    return @vel_y
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, 1.0, 1.0)
  end

end