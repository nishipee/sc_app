require 'rails_helper'

RSpec.describe PurchaseHistoryAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @purchase_history_address = FactoryBot.build(:purchase_history_address, user_id: user.id)
  end

  describe "商品購入機能" do
    context "内容に問題がない場合" do
      it "tokenがあり全ての値が正しく入力されていれば購入できる" do
        expect(@purchase_history_address).to be_valid
      end
      it "building_nameが空でも購入できる" do
        @purchase_history_address.building_name = ""
        expect(@purchase_history_address).to be_valid
      end
    end

    context "内容に問題がある場合" do
      it "tokenが空では購入できない" do
        @purchase_history_address.token = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("カード情報が確認できません")
      end
      it "postcodeが空では購入できない" do
        @purchase_history_address.postcode = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "prefeecture_idが1では購入できない" do
        @purchase_history_address.prefecture_id = 1
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it "cityが空では購入できない" do
        @purchase_history_address.city = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it "house_numberが空では購入できない" do
        @purchase_history_address.house_number = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("番地を入力してください")
      end
      it "phone_numが空では購入できない" do
        @purchase_history_address.phone_num = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it "郵便番号が全角数字では購入できない" do
        @purchase_history_address.postcode = "１２３ー４５６７"
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("郵便番号はハイフンを含む半角数字で入力してください")
      end
      it "郵便番号にハイフンが含まれていなければ購入できない" do
        @purchase_history_address.postcode = "1234567"
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("郵便番号はハイフンを含む半角数字で入力してください")
      end
      it "電話番号が全角数字では購入できない" do
        @purchase_history_address.phone_num = "０９０１２３４５６７８"
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("電話番号は半角数字で入力してください")
      end
      it "電話番号が12桁以上では購入できない" do
        @purchase_history_address.phone_num = "090123456789"
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("電話番号は11文字以内で入力してください")
      end
      it "電話番号が英数混合では交遊できない" do
        @purchase_history_address.phone_num = "090abcd5678"
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("電話番号は半角数字で入力してください")
      end
      it "userが紐づいていないと購入できない" do
        @purchase_history_address.user_id = nil
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
