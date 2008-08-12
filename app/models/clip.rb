class Clip < ActiveRecord::Base
  belongs_to :episode
  belongs_to :show
  belongs_to :season
  acts_as_list :show
  has_attachment :storage => :s3
  acts_as_list
  acts_as_taggable_on :tags
end
