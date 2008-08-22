class Playlist < ActiveRecord::Base
  acts_as_taggable_on :tags
  
  def clips
    @clips ||= Clip.tagged_with(self.tag_list, :on => :tags)
  end
end
