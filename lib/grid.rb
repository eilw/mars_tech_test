class Grid

  def leave_scent(direction)
    @scent = direction
  end

  def has_scent?(direction)
    @scent == direction
  end 

end
