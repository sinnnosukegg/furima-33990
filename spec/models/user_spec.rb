require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録/ユーザー情報" do
    context "新規登録するとき" do
    it "passwordとpassword_confirmation,first_name,last_name,（全角・ひらがな）,kana_first_name,kana_last_name（全角・カタカナ）
        生年月日が記入できなければ登録できない" do
        expect(@user).to be_valid
    end
  end

  context "新規登録できない時" do
    it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
  end

  it "emailが空では登録できない" do
    @user.email = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it "emailに@が含まれていなければ登録できない" do
    @user.email = "abc123"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end

  it "重複したemailがあると登録できない" do
    first_user = FactoryBot.create(:user, email: "tt@tt")
    another_user = FactoryBot.build(:user, email: first_user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end

  it "passwordが空では登録できない" do
    @user.password = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it "passwordが半角英字のみでは登録できない" do
    @user.password = "daimon"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "passwordが数字のみでは登録できない" do
    @user.password = "123456789"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    
  end

  it "passwordが５文字以下では登録できない" do
    @user.password = "zzzzz"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    
  end

  it "passwordとpassword_confirmationが一致しなければ登録できない" do
    @user.password = "zzzzzz"
    @user.password_confirmation = "vvvvvv"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "passwordを記述してもpassword_confirmationが空では登録ができない" do
    @user.password_confirmation = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
  end

  it 'passwordが全角では登録できない' do
    @user.password = "ＺＥＮＫＡＫＵ"
    @user.password_confirmation = "ＺＥＮＫＡＫＵ"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
  end

  it "last_nameが空では登録できない"do
  @user.last_name = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name can't be blank")
  end

  it "first_nameが空では登録できない"do
  @user.first_name = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it 'first_nameが英字では登録できない' do
    @user.first_name = "tarou"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
  end

  it 'last_nameが英字では登録できない' do
    @user.last_name = "yamada"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
  end

  it 'first_nameが半角では登録できない' do
    @user.first_name = "ﾔﾏﾀﾞ"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
  end

  it 'last_nameが半角では登録できない' do
    @user.last_name = "ﾀﾛｳ"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
  end

  it 'first_nameが数字では登録できない' do
    @user.first_name = "1234"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
  end

  it 'last_nameが数字では登録できない' do
    @user.last_name = "5678"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
  end

  it "last_name_kanaが空では登録できない"do
  @user.last_name_kana = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name kana can't be blank")
  end

  it "first_name_kanaが空では登録できない"do
  @user.first_name_kana = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end

  it 'first_name_kanaが半角では登録できない' do
    @user.first_name_kana = "ｶﾅ"
    @user.valid?
    expect(@user.errors.full_messages).to include("First kana name 全角文字でカナを使用してください")
  end

  it 'last_name_kanaが半角では登録できない' do
    @user.last_name_kana = "ｶﾅ"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana 全角文字でカナを使用してください")
  end

  it 'first_name_kanaが漢字では登録できない' do
    @user.first_name_kana = "金"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana 全角文字でカナを使用してください")
  end

  it 'last_name_kanaが漢字では登録できない' do
    @user.last_name_kana = "銀"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana 全角文字でカナを使用してください")
  end

  it 'first_name_kanaがひらがなでは登録できない' do
    @user.first_name_kana = "かな"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana 全角文字でカナを使用してください")
  end

  it 'last_name_kanaがひらがなでは登録できない' do
    @user.last_name_kana = "かな"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana 全角文字でカナを使用してください")
  end

  it 'first_name_kanaが英字では登録できない' do
    @user.first_name_kana = "kana"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana 全角文字でカナを使用してください")
  end

  it 'last_name_kanaが英字では登録できない' do
    @user.last_name_kana = "kana"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana 全角文字でカナを使用してください")
  end

  it 'first_name_kanaが数字では登録できない' do
    @user.first_name_kana = "12"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana 全角文字でカナを使用してください")
  end

  it 'last_name_kanaが数字では登録できない' do
    @user.last_name_kana = "12"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana 全角文字でカナを使用してください")
  end

  it "birth_dayが空では登録できない"do
    @user.birth_day = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth_day can't be blank")
  end
end
  describe "ログイン/ユーザー情報" do
    context "ログインできる時" do
      it "登録したemailとpasswordであれば登録ができる" do
      expect(@user).to be_valid
      end
    end

    context "ログインできない場合" do
      it "emailが空ではログインできない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空ではログインできない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "登録したemailとpasswordに相違があればログインできない" do
        @user.password = "zzzzzz"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end