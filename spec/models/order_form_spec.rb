require 'rails_helper'
describe OrderForm do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '全ての項目が存在すれば購入できる' do
        expect(@order_form).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'カード情報（token）が空では購入できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では購入できない' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が不正な形式では購入できない' do
        @order_form.postal_code = '0000000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号が半角数字以外では購入できない' do
        @order_form.postal_code = '000-000a'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県が未選択では購入できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市区町村が空では購入できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @order_form.addresses = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が空では購入できない' do
        @order_form.phone = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号にハイフンがあると購入できない' do
        @order_form.phone = '000-000-0000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone is invalid')
      end
      it '電話番号が１２桁以上だと購入できない' do
        @order_form.phone = '000111122223'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone is invalid')
      end
      it '電話番号が半角数字以外だと購入できない' do
        @order_form.phone = '0001111222a'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone is invalid')
      end
    end
  end
end

# - 配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること
# - 郵便番号にはハイフンが必要であること（123-4567となる）
# - 電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）
