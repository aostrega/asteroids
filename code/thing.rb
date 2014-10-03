# Base class for all game things.
class Thing
  attr_accessor :position

  def initialize(args = {})
    @position = args.fetch(:position, V[0, 0])
  end
end
