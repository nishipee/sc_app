require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "nickname、email、password、password_confirmatonがあれば登録できる" do
        @user.postcode = ""
        @user.prefecture_id = ""
        @user.city = ""
        @user.house_number = ""
        @user.building_name = ""
        @user.phone_num = ""
        @user.birthday = ""
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが英数字6文字以上であれば登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end
      it "postcodeが空でも登録できる" do
        @user.postcode = ""
        expect(@user).to be_valid
      end
      it "prefecture_idが1でも登録できる" do
        @user.prefecture_id = 1
        expect(@user).to be_valid
      end
      it "cityが空でも登録できる" do
        @user.city = ""
        expect(@user).to be_valid
      end
      it "house_numberが空でも登録できる" do
        @user.house_number = ""
        expect(@user).to be_valid
      end
      it "building_nameが空でも登録できる" do
        @user.building_name = ""
        expect(@user).to be_valid
      end
      it "phone_numが空でも登録できる" do
        @user.phone_num = ""
        expect(@user).to be_valid
      end
      it "birthdayが空でも登録できる" do
        @user.birthday = ""
        expect(@user).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("再確認用パスワードとパスワードの入力が一致しません")
      end
      it "emailは@がなければ登録できない" do
        @user.email = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it "emailが重複していると登録できない" do
        another_user = FactoryBot.build(:user)
        another_user.save
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "abc12"
        @user.password_confirmation = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが英字だけでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
      end
      it "passwordが数字だけでは登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
      end
      it "passwordが全角では登録できない" do
        @user.password = "xyz１２３"
        @user.password_confirmation = "xyz１２３"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
      end
    end
  end
end
