class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  def index
  end

  def show
  end

  def edit
  end

  def vote
    news = News.find(params[:news_id])
    current_user.vote(news)
    redirect_to :back
  end

  def post_comment
    current_user.comments.create(
      params
        .require(:comment)
        .permit(:contents, :news_id)
    )
    redirect_to :back
  end

  def delete_comment
    current_user.comments.find(params[:id]).try(:destroy)
    redirect_to :back
  end

  private def set_user
    @user = User.find(params[:id])
  end
end
