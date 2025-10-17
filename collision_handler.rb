class CollisionHandler

  def self.handle_collisions(bullets, asteroids, player)

    @grillkorv = false

    #loopa över alla bullets
    #för varje bullet,
      #loopa över alla asteroider
         #kolla om aktuell bullet överlappar aktuellt asteroid 
            #om träff
              #bullet.hit
              #astroid.hit_by(bullet)
    
    bullets.each do |bullet|
      asteroids.each do |asteroid|
        if bullet.x >= asteroid.left && 
          bullet.x <= asteroid.right && 
          bullet.y >= asteroid.y && 
          bullet.y <= asteroid.y + asteroid.height
          
          @grillkorv = true
          
          #@asteroid.hit_by(bullet)
          
          p "Bullet träffa asteroid"    
        end
      end
    end

  end

  def grillkorv
    @grillkorv
  end 

end