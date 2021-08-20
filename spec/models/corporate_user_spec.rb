require 'rails_helper'

RSpec.describe CorporateUser, type: :model do
  before do
    @corporate_user = FactoryBot.build(:corporate_user)
  end

  describe "出店店舗新規登録" do
    context "新規登録できるとき" do
      it "全ての項目が存在すれば登録できる" do
        expect(@corporate_user).to be_valid
      end
      it "passwordとpassword_confirmationが英数字6文字以上であれば登録できる" do
        @corporate_user.password = "000aaa"
        @corporate_user.password_confirmation = "000aaa"
        expect(@corporate_user).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "nameが空では登録できない" do
        @corporate_user.name = ""
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("出店店舗名を入力してください")
      end
      it "postcodeが空では登録できない" do
        @corporate_user.postcode = ""
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "prefecture_idが1では登録できない" do
        @corporate_user.prefecture_id = 1
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("都道府県を選択してください")
      end
      it "cityが空では登録できない" do
        @corporate_user.city = ""
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("市区町村を入力してください")
      end
      it "house_numberが空では登録できない" do
        @corporate_user.house_number = ""
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("番地を入力してください")
      end
      it "building_nameが空では登録できない" do
        @corporate_user.building_name = ""
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("建物名を入力してください")
      end
      it "phone_numが空では登録できない" do
        @corporate_user.phone_num = ""
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("電話番号を入力してください")
      end
      it "postcodeが全角数字では登録できない" do
        @corporate_user.postcode = "１２３ー４５６７"
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("郵便番号はハイフンを含む半角数字で入力してください")
      end
      it "postcodeにハイフンが含まれていなければ登録できない" do
        @corporate_user.postcode = "1234567"
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("郵便番号はハイフンを含む半角数字で入力してください")
      end
      it "phone_numが全角数字では登録できない" do
        @corporate_user.phone_num = "０９０１２３４５６７８"
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("電話番号は半角数字で入力してください")
      end
      it "phone_numが12桁以上では登録できない" do
        @corporate_user.phone_num = "090123456789"
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("電話番号は11文字以内で入力してください")
      end
      it "phone_numが英数混合では登録できない" do
        @corporate_user.phone_num = "090abcd5678"
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("電話番号は半角数字で入力してください")
      end
      it "emailが空では登録できない" do
        @corporate_user.email = ""
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it "passwordが空では登録できない" do
        @corporate_user.password = ""
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "password_confirmationが空では登録できない" do
        @corporate_user.password_confirmation = ""
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("再確認用パスワードとパスワードの入力が一致しません")
      end
      it "emailは@がなければ登録できない" do
        @corporate_user.email = "testtest"
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it "emailが重複していると登録できない" do
        another_user = FactoryBot.build(:corporate_user)
        another_user.save
        @corporate_user.email = another_user.email
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it "passwordが5文字以下では登録できない" do
        @corporate_user.password = "abc12"
        @corporate_user.password_confirmation = "abc12"
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが英字だけでは登録できない" do
        @corporate_user.password = "aaaaaa"
        @corporate_user.password_confirmation = "aaaaaa"
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
      end
      it "passwordが数字だけでは登録できない" do
        @corporate_user.password = "000000"
        @corporate_user.password_confirmation = "000000"
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
      end
      it "passwordが全角では登録できない" do
        @corporate_user.password = "xyz１２３"
        @corporate_user.password_confirmation = "xyz１２３"
        @corporate_user.valid?
        expect(@corporate_user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
      end
    end
  end
end