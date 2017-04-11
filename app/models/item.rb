class Item < ActiveRecord::Base
  validates :item, :list_id, presence: true

  belongs_to :lists
end
