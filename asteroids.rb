require "gosu"

require_relative "Spaceship"
require_relative "Bullet"
require_relative "Asteroid"
require_relative "collision_handler"

class Game < Gosu::Window

  attr_reader :bullets

  def initialize
    super 1200, 800
    self.caption = "asteroids"
    @L_asteroids = []
    @M_asteroids = []
    @S_asteroids = []
    @bullets = []

    @middlex = self.width / 2
    @middley = self.height / 2

    @player = Spaceship.new(self)
    @player.warp(@middlex, @middley)

    @background = Gosu::Image.new("media/spacebackground2.png", :retro => true)

    @bg_offsetx = 0
    @bg_offsety = 0

    3.times do
      @L_asteroids << Asteroid.new(self)
    end

   
  end


  def update
    if Gosu.button_down?(Gosu::KB_LEFT) || Gosu::button_down?(Gosu::GP_LEFT) || Gosu::button_down?(Gosu::KB_A)
      @player.turn_left
    end
    if Gosu.button_down?(Gosu::KB_RIGHT) || Gosu::button_down?(Gosu::GP_RIGHT) || Gosu::button_down?(Gosu::KB_D)
      @player.turn_right
    end
    if Gosu.button_down?(Gosu::KB_UP) || Gosu::button_down?(Gosu::GP_BUTTON_0) || Gosu::button_down?(Gosu::KB_W)
      @player.accelerate
    end

    @player.move

    @bg_offsetx -= @player.vel_x * 0.3
    @bg_offsety -= @player.vel_y * 0.3

    if Gosu.button_down?(Gosu::KB_SPACE) 
      #if Time.now
      @player.shoot
    end

    @bullets.each do |bullet|
      bullet.move
    end

    @L_asteroids.each do |asteroid|
      asteroid.move
    end

    @bullets.delete_if do |bullet|
      bullet.off_screen?(1200, 800)
      #CollisionHandler.handle_collisions(@bullets, @L_asteroids, @player).grillkorv == true
    end

    #split_asteriods = @L_asteroids.reject {|asteroid| asteroid.grillkorv}

     #@bullets.delete_if {|bullet| bullet }

  end

  def draw

    @background.draw(@bg_offsetx - 1032, @bg_offsety - 668, 0, 2, 2)

    @player.draw
    @bullets.each do |bullet|
      bullet.draw
    end
    
    @L_asteroids.each do |asteroid|
      asteroid.draw
    end

  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end

end

toppbanan = Game.new.show