class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :microposts
    has_many :relationships
    has_many :followings, through: :relationships, source: :follow
    has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
    has_many :followers, through: :reverses_of_relationship, source: :user
    
    # フォローしようとしているother_userが自分自身ではないかを検証
    # selfにはuser.follow(other)を実行したときuserが代入される
    # 見つかればRelationを返し、見つからなければフォロー関係が保存される
    def follow(other_user)
      unless self == other_user
        self.relationships.find_or_create_by(follow_id: other_user.id)
      end
    end
    
    # フォローがあればアンフォローする。relationshipが存在すればdestroyする。
    def unfollow(other_user)
      relationship = self.relationships.find_by(follow_id: other_user.id)
      relationship.destroy if relationship
    end
    
    # self.followingsによりフォローしているUser達を取得
    # include?(other_user)によってother_userが含まれていないか確認し、含まれていればtrue、含まれていなければfalse
    def following?(other_user)
      self.followings.include?(other_user)
    end
end
