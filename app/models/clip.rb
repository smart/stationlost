class Clip < ActiveRecord::Base
  belongs_to :episode
  belongs_to :show
  belongs_to :season
  acts_as_list :show
  has_attachment :storage => :s3
  acts_as_list
  acts_as_taggable_on TAG_CONTEXTS
  
  def self.find_or_create_from_bucket(s_id, e_id, p_id, bucket, key)
    clip = Clip.find_or_initialize_by_season_id_and_episode_id_and_position(:season_id => s_id.to_i, :episode_id => e_id.to_i, :position => p_id.to_i)
    if clip.new_record?
      p "hello"
      s3_file = bucket[key]
      clip.temp_data = s3_file.value
      clip.content_type = "binary/octet-stream"
      clip.filename = "s#{s_id}e#{e_id}-c#{p_id}.flv"
      clip.save
    end
  end
  
  
end
