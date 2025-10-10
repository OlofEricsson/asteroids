class CollisionHandler

  def self.handle_collisions(bullets, asteroids, player)

    loopa över alla bullets
    för varje bullet,
      loopa över alla asteroider
         kolla om aktuell bullet överlappar aktuellt asteroid 
            om träff
              bullet.hit
              astroid.hit_by(bullet)

  end

end