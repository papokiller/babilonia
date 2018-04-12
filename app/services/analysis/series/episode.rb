class Analysis::Series::Episode
  attr_accessor :number, :name

  def initialize(number:, name:)
    @number = number
    @name = name
  end

end