require 'rails_helper'
describe OrderForm do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '全ての項目が存在すれば購入できる' do
        @order_form.valid?
        binding.pry
        expect(@order_form).to be_valid
        
      end
    end

    context '商品購入がうまくいかないとき' do
      it '' do
      end
    end
  end
end
