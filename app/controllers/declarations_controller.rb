class DeclarationsController < ApplicationController
	

  def create_declaration
  	 @check=Declaration.find_by_discussion_id(params[:discussion_id])
    if @check.blank?
	  @declaration=Declaration.new
	  @declaration.name = params[:declaration][:name]
	  @declaration.discussion_id =params[:discussion_id]
      respond_to do |format|
      if @declaration.save
          format.html { redirect_to :back, notice: 'Declaration  successfully created.' }
      end
    end 
    else
    	 redirect_to :back, notice: 'Declaration  already created for this discussion.'
    end 
  end

  def new
    @declaration=Declaration.new
    @discussion = Discussion.find(params[:discussion_id])
    respond_to do |format|
      format.html # show.html.erb
      format.js
    end 
  end
end