require "gosu"

require_relative "Spaceship"
require_relative "Bullet"

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

    #5.times do
      #@big_asteroids << Asteroid.new()
    #end
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

    if Gosu.button_down?(Gosu::KB_SPACE) 
      #if Time.now
      @player.shoot
    end

    @bullets.each do |bullet|
      bullet.move
    end

  end

  def draw
    @player.draw
    @bullets.each do |bullet|
      bullet.draw
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