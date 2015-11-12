class Wish < ActiveRecord::Base
  belongs_to :user
  has_many :grants

  # validates :media_type, inclusion: { }
  validates_inclusion_of :media_type, in: ["album", "series", "movie", "ebook", "gif"],
    message: "%{value} must be one of: 'album', 'series', 'movie', 'ebook', or 'gif'."
  validates_presence_of :user_id, :media_type, :title
end
