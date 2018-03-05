class Gamestate < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :state, inlusion: { in: ["like", "dislike", "wishlist"] }
  validates :game_id, uniqueness: {scope: :user_id, message: "A user can not have more than one state on a specific game"}
end
