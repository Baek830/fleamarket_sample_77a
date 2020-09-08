require 'rails_helper'

describe User do
  describe '#create' do

    it " nickname,email,password,password_confirmation,last_name,first_name,phonetic_last_name,phonetic_first_name,birthdayが存在すれば登録できること " do
      user = build(:user)
      expect(user).to be_valid
    end

    it " nicknameがない場合は登録できないこと " do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it " emailがない場合は登録できないこと " do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it " passwordがない場合は登録できないこと " do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it " passwordが存在してもpassword_confirmationがない場合は登録できないこと " do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it " passwordが7文字未満であれば登録できないこと " do
      user = build(:user, password: "aaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it " passwordが7文字以上で登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it " last_nameがない場合は登録できないこと " do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "phonetic_first_nameがない場合は登録できないこと" do
      user = build(:user, phonetic_first_name: nil)
      user.valid?
      expect(user.errors[:phonetic_first_name]).to include("を入力してください")
    end

    it "phonetic_last_nameがない場合は登録できないこと" do
      user = build(:user, phonetic_last_name: nil)
      user.valid?
      expect(user.errors[:phonetic_last_name]).to include("を入力してください")
    end

    it "birthdayがない場合は登録できないこと" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

    it " phonetic_last_nameが半角カナの場合は登録できないこと " do
      user = build(:user, phonetic_last_name: "ﾔﾏﾀﾞ")
      user.valid?
      expect(user.errors[:phonetic_last_name]).to include("は全角カタカナのみで入力して下さい")
    end

    it " phonetic_first_nameが半角カナの場合は登録できないこと " do
      user = build(:user, phonetic_first_name: "ｱﾔ")
      user.valid?
      expect(user.errors[:phonetic_first_name]).to include("は全角カタカナのみで入力して下さい")
    end

    it " phonetic_last_nameが半角の場合は登録できないこと " do
      user = build(:user, last_name: "ﾔﾏﾀﾞ")
      user.valid?
      expect(user.errors[:last_name]).to include("は全角のみで入力して下さい")
    end

    it " phonetic_first_nameが半角の場合は登録できないこと " do
      user = build(:user, first_name: "ｱﾔ")
      user.valid?
      expect(user.errors[:first_name]).to include("は全角のみで入力して下さい")
    end

  end
end