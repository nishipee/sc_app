require 'rails_helper'

RSpec.describe ScGroup, type: :model do
  before do
    @sc_group = FactoryBot.build(:sc_group)
  end

  describe "寄付先登録" do
    context "寄付先を登録できるとき" do
      it "image,name,introduction,how_donationが存在すれば登録できる" do
        expect(@sc_group).to be_valid
      end
      it "introductionが1000文字以下であれば登録できる" do
        @sc_group.introduction = Faker::Lorem.sentence(1000)
        expect(@sc_group).to be_valid
      end
    end

    context "寄付先を登録できないとき" do
      it "imageが空では登録できない" do
        @sc_group.image = nil
        @sc_group.valid?
        expect(@sc_group.errors.full_messages).to include "寄付先のイメージ画像を入力してください"
      end
      it "nameが空では登録できない" do
        @sc_group.name = ""
        @sc_group.valid?
        expect(@sc_group.errors.full_messages).to include "寄付先名を入力してください"
      end
      it "introductionが空では登録できない" do
        @sc_group.introduction = ""
        @sc_group.valid?
        expect(@sc_group.errors.full_messages).to include "寄付先の説明を入力してください"
      end
      it "how_donationが空では登録できない" do
        @sc_group.how_donation = ""
        @sc_group.valid?
        expect(@sc_group.errors.full_messages).to include "寄付の詳細を入力してください"
      end
      it "管理者が紐づいていなければ登録できない" do
        @sc_group.admin = nil
        @sc_group.valid?
        expect(@sc_group.errors.full_messages).to include "Adminを入力してください"
      end
    end
  end
end
