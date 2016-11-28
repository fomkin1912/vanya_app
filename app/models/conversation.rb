class Conversation < ActiveRecord::Base
	belongs_to :author, class_name: 'User'
	belongs_to :receiver, class_name: 'User'
	has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy

	validates :author, uniqueness: { scope: :receiver }

	scope :participating, -> (user) { where("(author_id = ? OR receiver_id = ?)", user.id, user.id) }
  scope :between, -> (sender_id, receiver_id) do
  	sql_clause = "author_id = sender_id AND receiver_id = receiver_id"
  	where("((author_id  = ? AND receiver_id = ?) OR (author_id = ? AND receiver_id = ?))",
  		    sender_id, receiver_id, receiver_id, sender_id).limit(1)
  end

  def with(current_user)
		author == current_user ? receiver : author
	end

	def participates?(user)
    author == user || receiver == user
	end

end
