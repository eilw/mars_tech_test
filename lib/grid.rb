class Grid

  def initialize
    @scent = []
  end

  def leave_scent(direction)
    @scent << direction
  end

  def has_scent?(direction)
    @scent.include? direction
  end

end
