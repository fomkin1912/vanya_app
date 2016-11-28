class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'receiver_id'
  has_many :personal_messages, dependent: :destroy


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #validates :name, :last_name, :email, presence: true
  validate :full_name_must_be_unique

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
