class Planet

  def initialize(coordinates, grid_klass)
    @territory = lay_out_grid(coordinates,grid_klass)
  end

  def has_scent?(coordinates, direction)
    select_grid(coordinates).has_scent?(direction)
  end

  def select_grid(coordinates)
    x = coordinates[0]
    y = coordinates[1]
    @territory[x][y]
  end

  def get_territory
    @territory.dup
  end

  def off?(coordinates)
    !select_grid(coordinates)
  end

  def leave_scent(coordinates, direction)
    select_grid(coordinates).leave_scent(direction)
  end

  private

  def lay_out_grid(coordinates,grid_klass)
    x_value = coordinates.split(' ').shift().to_i
    y_value = coordinates.split(' ').pop().to_i
    (0..x_value).map{(0..y_value)
                .map{grid_klass.new()}}
  end
end
