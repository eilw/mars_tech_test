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
    send((command+'_instruction').downcase.to_sym) unless lost?
  end

  def report_status
    @position.dup << @direction
  end

  private

  attr_reader :planet

  def lost?
    @lost
  end

  def set_as_lost
    @lost = true
  end

  def f_instruction
    move_forward(POSITION_CHANGE[@direction.to_sym]) unless planet.has_scent?(@position, @direction)
  end

  def r_instruction
    @direction = CLOCKWISE[@direction.to_sym]
  end

  def l_instruction
    @direction = COUNTER_CLOCKWISE[@direction.to_sym]
  end

  def move_forward(step)
    old_position = @position.dup
    @position = @position.map.with_index{ |pos,i| pos + step[i] }
    report_lost(old_position) if planet.off?(@position)
  end

  def report_lost(old_position)
    @position = old_position
    planet.leave_scent(@position, @direction)
    @direction += " LOST"
    set_as_lost
  end

end
