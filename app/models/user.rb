class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :last_name, :email, presence: true
  validate :full_name_must_be_unique

  has_secure_password

  def full_name
  	"#{name} #{last_name}"
  end

  private

  def full_name_must_be_unique
  	if new_record?
  		user = User.where(["name = ? AND last_name = ?", name, last_name])
  	else
  		user = User.where(["name = ? AND last_name = ? and id <> ?", name, last_name, id])
    end
  	errors.add(:full_name, "has already been taken") if user.present?
  end

end
