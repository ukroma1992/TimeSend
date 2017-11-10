class User < ApplicationRecord

  has_many :connections, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates_presence_of :time_zone
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def facebook
    self.connections.where(provider: "facebook").first
  end

  def twitter
    self.connections.where(provider: "twitter").first
  end

end
