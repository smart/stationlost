class Episode < ActiveRecord::Base
  has_many :clips
  belongs_to :season
  has_permalink :name
  
  def to_param
    "#{number}-#{permalink}"
  end
end
