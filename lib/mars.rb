class Mars
  attr_reader :planet
  def initialize(coordinates, grid_klass)
    @planet = create_planet(coordinates,grid_klass)
  end

  def create_planet(coordinates,grid_klass)
    grid = []
    x_coordinate = coordinates.split(' ').shift().to_i
    y_coordinate = coordinates.split(' ').pop().to_i
    x_coordinate.times do |x|
      y_grid = []
      y_coordinate.times do |y|
        y_grid << grid_klass.new()
      end
      grid << y_grid
    end
    grid
  end

  def has_scent?(x_y_direction)
    grid = select_grid(x_y_direction)
    grid.has_scent?('N')
  end

  def select_grid(x_y_direction)
    x = x_y_direction[0]-1
    y = x_y_direction[1]-1
    planet[x][y]
  end


end
