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

  validates :image,
  validates :name, :text, presence: true
  validates :explanation :text, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :state_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :shipment_source_id, numericality: { other_than: 1 } 
  validates :days_to_ship_id, numericality: { other_than: 1 } 
  validates :price,
  validates :price, length: { minimum: 300 }
  validates :price, length: { maximum: 9999999 }
  with_options format: { with: /^[0-9]+$/, message: "is invalid. Input half-width numbers." } do
    validates :price
  end
end
