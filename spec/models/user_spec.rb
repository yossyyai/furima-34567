require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'first_name,last_name,first_name_kana,last_name_kana,nickname,birth_dateとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'last_name_kanaが空では登録できないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'birth_dateが空では登録できないこと' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが全角では登録できないこと' do
      @user.password = '1平仮名だよ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'first_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end
    it 'last_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.last_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end
    it 'first_name_kanaが全角カタカナ以外では登録できないこと' do
      @user.first_name_kana = '漢字'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
    it 'last_name_kanaが全角カタカナ以外では登録できないこと' do
      @user.last_name_kana = '漢字'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
    end

    it 'Emailは＠がないと登録できない' do
      @user.email = 'testexamle.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'aaa45'
      @user.password_confirmation = 'aaa45'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが英語のみでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'passwordが数字のみでは登録できないこと' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end
end
