class Comment < ApplicationItem
  table name: :comments

  field :author
  field :content

  validates_presence_of :author, :content
  validates :author, length: { maximum: 64 }
  validates :content, length: { maximum: 512 }
end
