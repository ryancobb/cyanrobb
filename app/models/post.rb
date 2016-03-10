class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_attachments, :dependent => :destroy

  accepts_nested_attributes_for :post_attachments

  validates :title, presence: true
  validates :user_id, presence: true
end
