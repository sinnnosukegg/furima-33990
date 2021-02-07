require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録機能の確認' do
    context '商品登録できる時' do
      it 'category,state,burden,area,daysの選択と
        name,expostion,priceを記入して画像が一枚添付できてあれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録できないとき' do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.expostion = ""
        @item.valid?

        expect(@item.errors.full_messages).to include("Expostion can't be blank")
      end
      it 'カテゴリーが空では登録できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'カテゴリーが未選択では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態についての情報が空では登録できない' do
        @item.state_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("State is not a number")
      end
      it '商品の状態について未選択では登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it '配送料の負担についての情報が空では登録できない' do
        @item.burden_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden is not a number")
      end
      it '配送料の負担についての情報が未選択では登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end
      it '発送元の地域についての情報が空では登録できない' do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area is not a number")
      end
      it '発送元の地域についての情報が未選択では登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it '発送までの日数についての情報が空では登録できない' do
        @item.days_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days is not a number")
      end
      it '発送までの日数についての情報が未選択では登録できない' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 1")
      end
      it '販売価格についての情報が空では登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300円より下の値段では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 上記の販売価格を半角数字で入力してください")
      end
      it '販売価格が9999999円より上の値段では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 上記の販売価格を半角数字で入力してください")
      end
      it '販売価格がひらがなでは登録できない' do
        @item.price = "ろくじゅうまんえん"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 上記の販売価格を半角数字で入力してください")
      end
      it '販売価格が漢字では登録できない' do
        @item.price = "五百円"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 上記の販売価格を半角数字で入力してください")
      end
      it '販売価格が全角カタカナでは登録できない' do
        @item.price = "ゴヒャクエン"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 上記の販売価格を半角数字で入力してください")
      end
      it '販売価格が半角カタカナでは登録できない' do
        @item.price = "ﾆﾏﾝｴﾝ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 上記の販売価格を半角数字で入力してください")
      end
      it '販売価格が半角英字では登録できない' do
        @item.price = "Two_thousand"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 上記の販売価格を半角数字で入力してください")
      end
      it '販売価格が全角数字では登録できない' do
        @item.price = "１２３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 上記の販売価格を半角数字で入力してください")
      end
    end
  end
end   
