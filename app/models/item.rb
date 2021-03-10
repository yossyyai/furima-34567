class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :status
  belongs_to :charges
  belongs_to :prefectures
  belongs_to :ship_date

end