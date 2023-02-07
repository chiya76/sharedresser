require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテム投稿' do
    context 'アイテムが投稿できるとき' do
      it '不足している項目がなく、条件を満たしていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context 'アイテムが投稿できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      # it 'item_nameが41文字以上では登録できない' do
      #   @item.item_name = Faker::Lorem.characters(number: 41)
      #   @item.valid?
      #   expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      # end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      # it 'descriptionが1001文字以上では登録できない' do
      #   @item.description = Faker::Lorem.characters(number: 1001)
      #   @item.valid?
      #   expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      # end

      it 'category_idが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'rating_idが空では登録できない' do
        @item.rating_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Rating can't be blank")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
