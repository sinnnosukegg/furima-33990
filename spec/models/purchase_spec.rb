require 'rails_helper'

RSpec.describe Purchase, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe "商品の購入" do

    context "購入できる" do
      it "十分な値が入力された場合購入できる" do
        expect(@purchase).to be_valid
      end

      it "建物名が空でも購入できる" do
        @purchase.build = ""
        expect(@purchase).to be_valid
      end
    end

    context "購入できない" do
      it "クレジットカード情報が空では購入できないこと" do
        @purchase.token = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end

      it "郵便番号が空では購入できない" do
        @purchase.postal = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal can't be blank", "Postal Postal code Input correctly")
      end

      it "郵便番号にハイフンがなければ購入できない" do
        @purchase.postal = "12345567"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal Postal code Input correctly")
      end

      it "郵便番号が全角数字の場合購入できない" do
        @purchase.postal = "１２３−４５６７"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal Postal code Input correctly")
      end

      it "都道府県が空では購入できない" do
        @purchase.area_id = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Area Select")
      end

      it "都道府県が未選択だと購入できない" do
        @purchase.area_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Area Select")
      end

      it "市区町村が空では購入できない" do
        @purchase.city = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空では購入できない" do
        @purchase.addres = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Addres can't be blank")
      end

      it "電話番号が空では購入できない" do
        @purchase.call = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Call can't be blank")
      end

      it "電話番号が全角数字では購入できない" do
        @purchase.call = "０９０１２３４５６７８"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Call Input only number")
      end

      it "電話番号が数字のみでないと購入できない" do
        @purchase.call = "abc12345678"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Call Input only number")
      end

      it "電話番号が11桁以内でないと購入できない" do
        @purchase.call = "090123456789"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Call is too long (maximum is 11 characters)")
      end

      it "user_idが空だと購入できない" do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空だと購入できない" do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
