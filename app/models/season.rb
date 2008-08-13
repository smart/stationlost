class Season < ActiveRecord::Base
  has_many :episodes
  has_many :clips
  has_permalink :name
  
  validates_uniqueness_of :name, :permalink
  
  def to_param
    "#{id}-#{permalink}"
  end
end
