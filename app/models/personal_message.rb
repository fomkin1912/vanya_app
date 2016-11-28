class PersonalMessage < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true
end
