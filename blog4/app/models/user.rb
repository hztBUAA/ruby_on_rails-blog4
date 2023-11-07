class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attribute :user_name, :string
  attribute :phone_number, :string

  has_many :followships#用户关注的人
  has_many :reverse_followships, class_name: "Followship", foreign_key: "following_user_id"#谁关注了用户
  has_many :followings, through: :followships
  has_many :followers, through: :reverse_followships

  def follow(other_user)
    unless self.following?(other_user)
      self.followships.create(following: other_user)#需要是单数following   self用户关注了other_user用户（following）
    end
  end

  def unfollow(other_user)
    followship = self.followships.find_by(following: other_user)#找到这个用户的followship  里面全是self用户关注的各种人 按照following_user查找
    followship.destroy if followship
  end

  def following?(other_user)
    # self.followships.include?(following: other_user)
    self.followships.where(following: other_user).exists?
  end

  def follower?(other_user)
    # self.reverse_followships.include?(follower: other_user)
    self.reverse_followships.where(follower: other_user).exists?
  end

end
