class PurchaseHistoryAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :house_number, :building_name, :phone_num, :total_price, :total_charge, :user_id, :purchase_history_id, :token, :product_id, :quantity, :points

  validates :token, presence: { message: "が確認できません" }

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフンを含む半角数字で入力してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :city
    validates :house_number
    validates :phone_num, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }
    validates :user_id
  end

  def all_save
    point = (total_price.to_i - total_charge.to_i) * 0.05
    purchase_history = PurchaseHistory.create(total_price: total_price, total_charge: total_charge, user_id: user_id, points: point)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, house_number: house_number, phone_num: phone_num, purchase_history_id: purchase_history.id)

    # product_idを個別に分割し、idごとにproduct_purchase_historyテーブルへ保存
    
    sleep(1)
    sum = 0
    product_id.split("").each do 
      ProductPurchaseHistory.create(product_id: product_id[sum], purchase_history_id: purchase_history.id, quantity: quantity.split("")[sum], user_id: user_id)
      sum += 1
    end
  end
end