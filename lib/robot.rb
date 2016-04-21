class Robot

  POSITION_CHANGE = {E: [1,0], W: [-1,0], N:[0,1], S:[0,-1]}
  CLOCKWISE = {E: 'S', S:'W', W:'N', N: 'E'}
  COUNTER_CLOCKWISE = {S: 'E', E:'N', N:'W', W: 'S'}


  def initialize(planet, start_coordinate)
    @position = start_coordinate.split(' ')[0..1].map{|x| x.to_i}
    @direction = start_coordinate.split(' ')[2]
    @planet = planet
  end

  def move(command)
    send(command.downcase.to_sym)
  end

  def report_status
    get_position.dup << get_direction
  end

  private

  def f
    #check if grid has scent in that direction
    move_forward(POSITION_CHANGE[get_direction.to_sym])
  end

  def r
    @direction = CLOCKWISE[@direction.to_sym]
  end

  def l
    @direction = COUNTER_CLOCKWISE[@direction.to_sym]
  end

  def move_forward(change)
    @position = get_position.map.with_index{ |pos,i| pos + change[i] }
  end

  def get_position
    @position
  end

  def get_direction
    @direction
  end



end
