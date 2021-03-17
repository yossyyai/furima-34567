class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :house_number, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)", allow_blank: true }
    validates :prefectures_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9０-９]+\z/ , allow_blank: true },length: { maximum: 11 }
    validates :item_id
    validates :user_id
  end




  def save
    # 購入情報の保存
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
