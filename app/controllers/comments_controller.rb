class CommentsController < ApplicationController
  def index
  end

  def create
  	@comment = Comment.new(params[:comment])
    @picture = @comment.picture
    respond_to do |format|
      if @comment.save
        format.html { redirect_to pictures_path}
        format.js  {}
      end
    end
  end

  def show_all_comments
    @comments = Comment.get_indexed_comments(params[:picture_id])
    respond_to do |format|
        format.js  
      end
  end

end
