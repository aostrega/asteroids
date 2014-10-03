require 'things'

class AsteroidsGame < Game
  BG_COLOR = C['#013']

  attr_accessor :things

  def setup
    display.size = V[720, 720]

    @things = []

    # Spawn player ship.
    @things << Ship.new(position: display.size / 2)

    # Spawn 6 six-sided asteroids.
    6.times do
      @things << Asteroid.new(position: display.size * V[rand, rand],
                              side_count: 6)
    end

    # Everything is made of 4-pixel-width lines.
    display.stroke_width = 4

    # All text is 16px DejaVu Serif.
    display.text_font = Font['deja-vu-serif.ttf']
    display.text_size = 16
  end

  def update(elapsed)
    # Clear with background color
    display.fill_color = BG_COLOR
    display.clear

    # Update & draw all things.
    @things.each do |t|
      next if t.nil? # TODO: obviate w/ sturdier solution
      t.update(elapsed, self)
      t.draw(display)
    end

    draw_help(display)
  end

  private

  # Draw helpful instructions.
  def draw_help(d)
    d.fill_color = C['#999']

    d.fill_text("Left/Right - Turn", V[500, 100])
    d.fill_text("Up - Thrust", V[500, 120])
    d.fill_text("z - Shoot", V[500, 140])
  end
end
