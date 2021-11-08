class User < ApplicationRecord
    has_secure_password

    def self.from_omniauth(auth)
        User.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |u|
            u.username = auth[:info][:name]
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex[15]
            end
    end

    has_many :comments, dependent: :destroy
    has_many :move_tutorials, through: :comments
    has_many :move_tutorials, dependent: :destroy

    # validates :username, :email, uniqueness: true
    validates :username, :email, :password, presence: true
    # validates :password, length: {in: 6..20}
    
end
