class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  belongs_to :category
  belongs_to :status
  belongs_to :charges
  belongs_to :prefectures
  belongs_to :ship_date
  has_one_attached :image

  has_one :order

  with_options presence: true do
    validates :name
    validates :image
    validates :description
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :charges_id
    validates :prefectures_id
    validates :ship_date_id
  end

  validates :price, inclusion: { in: (300..9_999_999) }, format: { with: /\A[0-9]+\z/ }
end
