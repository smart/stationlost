class Playlist < ActiveRecord::Base
  acts_as_taggable_on TAG_CONTEXTS
  
  def clips
    TAG_CONTEXTS.inject(nil) do |counter, context|
      p self.send(context)
      p counter
      next if self.send(context).empty? 
      results = Clip.tagged_with( self.send("#{context.to_s.singularize}_list".to_sym), :on => context, :match_all => true )
      p results
      return results if counter.nil?
      results.select do |result|
        counter.includes?(result)
      end
    end
  end
  
  
  def clips_mid
    TAG_CONTEXTS.inject(Clip) do |counter, context| 
      p counter
      p context
      p self.send(context)
      if counter == Clip
        counter.tagged_with( self.send(context), :on => context, :match_all => true )
      else
        counter + counter.select do |item| 
          p item.send(context)
          p self.send(context)
          item.send(context) == self.send(context)
        end
      end
    end
  end
end
