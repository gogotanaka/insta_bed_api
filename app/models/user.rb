class User < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :booking_invitations, class_name: '::Invitation', foreign_key: :booking_user_id
  has_many :invitations

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
