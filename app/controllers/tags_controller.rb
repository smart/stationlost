class TagsController < ApplicationController
  
  
  def toggle
    @object_name = params[:object_name]
    @object_id = params[:object_id]
    @context = params[:context]
    @tag_name = params[:tag_name]
    @object = params[:object_name].camelcase.constantize.find(params[:object_id])
    @object.send("#{params[:context]}_toggle".to_sym, params[:tag_name])
    @object.save_tags
    respond_to do |format|
      format.js {}
    end
  end
  
end