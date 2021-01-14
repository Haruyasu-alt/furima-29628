require 'rails_helper'

RSpec.describe Items, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空では登録できない" do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.nickname = ""  # nicknameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = ""  # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
    end
    it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが5文字以下では登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end
