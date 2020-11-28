require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目が埋められ、価格が¥300〜9,999,999だと登録できる" do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "商品画像がないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank") 
      end
      it "商品名が空では登録できない" do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank") 
      end
      it "商品の説明が空では登録できない" do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank") 
      end
      it "カテゴリー情報が「--」では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1") 
      end
      it "商品状態の情報が「--」では登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1") 
      end
      it "配送料負担の情報が「--」では登録できない" do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1") 
      end
      it "発送元地域の情報が「--」では登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1") 
      end
      it "発送日数の情報が「--」では登録できない" do
        @item.lead_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Lead time must be other than 1") 
      end
      it "販売価格が空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank") 
      end
      it "販売価格が全角では登録できない" do
        @item.price = '１００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number") 
      end
      it "販売価格が文字列では登録できない" do
        @item.price = 'ﾋｬｸ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number") 
      end
      it "販売価格が¥299以下では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299") 
      end
      it "販売価格が¥10000000以上では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000") 
      end
    end
  end
end