require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '不足している項目がなく、条件を満たしていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは128文字以内で入力してください')
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角で英字と数字の両方を含んでください')
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角で英字と数字の両方を含んでください')
      end

      it 'passwordが全角を含んでいると登録できない' do
        @user.password = '1aaaaあ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角で英字と数字の両方を含んでください')
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end

      it 'age_idが空では登録できない' do
        @user.age_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("年齢を入力してください")
      end

      it 'face_type_idが空では登録できない' do
        @user.face_type_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("顔タイプを入力してください")
      end

      it 'makeup_type_idが空では登録できない' do
        @user.makeup_type_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("メイク傾向を入力してください")
      end

      it 'personal_color_idが空では登録できない' do
        @user.personal_color_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("パーソナルカラーを入力してください")
      end

      it 'skin_color_idが空では登録できない' do
        @user.skin_color_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("肌の色を入力してください")
      end

      it 'skin_type_idが空では登録できない' do
        @user.skin_type_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("肌タイプを入力してください")
      end
    end
  end
end
