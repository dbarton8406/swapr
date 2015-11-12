class Grant < ActiveRecord::Base
  belongs_to :wish
  belongs_to :user

  has_attached_file :gift
  validates :gift, attachment_presence: true
  validates_attachment_file_name :gift, matches: [
    /mp3\Z/, /ogg\Z/, /flac\Z/, /pdf\Z/, /epub\Z/, /djvu\Z/,
    /gif\Z/, /gifv\Z/, /mp4\Z/, /mkv\Z/, /avi\Z/, /webm\Z/
  ]

  validates_presence_of :wish_id, :user_id
end
