class User < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :relation_vote
  has_many :vote_news, through: :relation_vote, source: :news

  has_many :comments

  has_many :news

  def vote(news)
    unless vote?(news)
      vote_news << news
      news.point += 1
      news.save
    end
  end

  def vote?(news)
    vote_news.include?(news)
  end
end
