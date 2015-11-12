class Wish < ActiveRecord::Base
  belongs_to :user

  # validates :media_type, inclusion: { }
  validates_inclusion_of :media_type, in: ["album", "series", "movie", "ebook", "gifs"],
    message: "%{value} must be one of: 'album', 'series', 'movie', 'ebook', or 'gifs'."
  validates_presence_of :user_id, :media_type, :title
end
