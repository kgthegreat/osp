class School < ActiveRecord::Base

  #uncomment for solr
  searchable do
    string :name
    text :description
    integer :id
  end
  has_many :line_items
  def self.find_schools_to_display
    find(:all, :order => "name")
  end

  def self.find_schools_by_search_criteria(query)
   find(:all, :conditions => "description LIKE '%#{query}%' or name LIKE '%#{query}%'" )
  end

  validates_presence_of :name , :description

end


