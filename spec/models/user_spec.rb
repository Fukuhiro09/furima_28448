require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.nickname: ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.email: ""
      user.valid?
      expect(user.errors.full_messages).to include("email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User. password:""
      user.valid?
      expect(user.errors.full_messages).to include("password can't be blank")
    end
    it "first_name" do
      user = User. first_name: ""
      user.valid?
      expect(user.errors.full_messages).to include("first_name can't be blank")
    end
    it "last_name" do
      user = User.last_name: ""
      user.valid?
      expect(user.errors.full_messages).to include("last_name can't be blank")
    end
    it "kana_first" do
      user = User. kana_first: ""
      user.valid?
      expect(user.errors.full_messages).to include("kana_first can't be blank")
    end
    it "kana_last_name" do
      user = User. kana_last_name: ""
      user.valid?
      expect(user.errors.full_messages).to include(" kana_last_name can't be blank")
    end
    it "birthday" do
      user = User. birthday: ""
      user.valid?
      expect(user.errors.full_messages).to include("birthday can't be blank")
    end
  end
end