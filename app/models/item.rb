class Item < ApplicationRecord

  belongs_to :user
  has_one :buy_record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :shipment_source
  belongs_to :days_to_ship

  with_options presence: true do
  validates :image
  validates :name
  validates :explanation 
  validates :price
end

with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :state_id 
  validates :delivery_fee_id
  validates :shipment_source_id 
  validates :days_to_ship_id
end

  with_options format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width numbers." } do
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end

end