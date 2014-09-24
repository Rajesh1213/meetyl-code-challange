class PicturesController < ApplicationController
  def index
  	@pictures = Picture.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(params[:picture])
    if @picture.save
      flash[:success] = "Picture Created Successfully"
      redirect_to pictures_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @picture = Picture.get(params[:id])
    @picture.comments << @comment
  end
end
