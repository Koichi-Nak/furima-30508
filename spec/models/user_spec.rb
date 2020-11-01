require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、last_name_kan、first_name_kan、last_name_kana、first_name_kana、birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが英数字混合であれば登録できる" do
        @user.password = "a1a1a1"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "a2345678"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it "last_name_kan、first_name_kanが全角（漢字・ひらがな・カタカナ）であれば登録出来る" do
        @user.last_name_kan = "佐とウ"
        @user.first_name_kan = "太ろウ"
        expect(@user).to be_valid
      end
      it "last_name_kana、first_name_kanaが全角（ひらがな・カタカナ）であれば登録出来る" do
        @user.last_name_kana = "さとウ"
        @user.first_name_kana = "たロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "nicknameが7文字以上であれば登録できない" do
        @user.nickname = "abc4567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 6 characters)")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "a2345"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_name_kanが空では登録出来ない" do
        @user.last_name_kan = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kan can't be blank")
      end
      it "last_name_kanが全角（漢字・ひらがな・カタカナ）でない場合は登録出来ない" do
        @user.last_name_kan = "ｚｅｎｋａｋｕ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kan is invalid")
      end
      it "first_name_kanが空では登録出来ない" do
        @user.first_name_kan = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kan can't be blank")
      end
      it "first_name_kanが全角（漢字・ひらがな・カタカナ）でない場合は登録出来ない" do
        @user.first_name_kan = "ｚｅｎｋａｋｕ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kan is invalid")
      end
      it "last_name_kanaが空では登録出来ない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaが半角では登録出来ない" do
        @user.last_name_kana = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "last_name_kanaが全角（漢字）では登録出来ない" do
        @user.last_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaが空では登録出来ない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaが半角では登録出来ない" do
        @user.first_name_kana = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "first_name_kanaが全角（漢字）では登録出来ない" do
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "birth_dateが空では登録出来ない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
