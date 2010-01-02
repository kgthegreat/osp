class List
  attr_reader :items

  def initialize
    @items = []
  end

  def add_school(school)
    @items << school
    school
  end

  def remove_school(school)
    @items.delete(school)
  end

end
