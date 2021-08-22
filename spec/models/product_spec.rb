require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe "新規商品出品" do
    context "新規商品を出品できるとき" do
      it "image,name,introduction,category1_id,category2_id,category3_id,charge_id,prefecture_id,scheduled_day_id,priceが存在すれば出品できる" do
        expect(@product).to be_valid
      end
      it "nameが40文字以下であれば出品できる" do
        @product.name = Faker::Lorem.sentence(40)
        expect(@product).to be_valid
      end
      it "introductionが1000文字以下であれば出品できる" do
        @product.introduction = Faker::Lorem.sentence(1000)
        expect(@product).to be_valid
      end
      it "category_id,charge_id,area_id,scheduled_day_id,が1以外であれば登録できる" do
        @product.category1_id = 2
        @product.category2_id = 2
        @product.category3_id = 2
        @product.charge_id = 2
        @product.prefecture_id = 2
        @product.scheduled_day_id = 2
        expect(@product).to be_valid
      end
      it "priceが半角数字であれば登録できる" do
        @product.price = 9999
        expect(@product).to be_valid
      end
    end

    context "新規商品を出品できないとき" do
      it "imageが空では出品できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "商品画像を入力してください"
      end
      it "nameが空では出品できない" do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include "商品名を入力してください"
      end
      it "introductionが空では出品できない" do
        @product.introduction = ""
        @product.valid?
        expect(@product.errors.full_messages).to include "商品説明を入力してください"
      end
      it "category1_idが1では出品できない" do
        @product.category1_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "社会貢献カテゴリーを選択してください"
      end
      it "category2_idが1では出品できない" do
        @product.category2_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "品目カテゴリーを選択してください"
      end
      it "category3_idが1では出品できない" do
        @product.category3_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "商品詳細カテゴリーを選択してください"
      end
      it "charge_idが1では出品できない" do
        @product.charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "送料を選択してください"
      end
      it "prefecture_idが1では出品できない" do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "発送元の地域を選択してください"
      end
      it "scheduled_day_idが1では出品できない" do
        @product.scheduled_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "発送までの日数を選択してください"
      end
      it "priceが空では出品できない" do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include "販売価格は半角数字で入力してください"
      end
      it "priceが全角では出品できない" do
        @product.price = "１０００"
        @product.valid?
        expect(@product.errors.full_messages).to include "販売価格は半角数字で入力してください"
      end
      it "priceが半角英数字では出品できない" do
        @product.price = "aaaaa"
        @product.valid?
        expect(@product.errors.full_messages).to include "販売価格は半角数字で入力してください"
      end
      it "ユーザーが紐づいていなければ出品できない" do
        @product.corporate_user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Corporate userを入力してください"
      end
    end
  end
end
