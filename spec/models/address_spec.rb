require 'rails_helper'

describe DeliveryAddress do
  before do
    @address = FactoryBot.build(:DeliveryAddress)
  end

  describe '配送先情報入力' do
    context '配送先情報入力がうまくいくとき' do
      it " last_name,first_name,phonetic_last_name,phonetic_first_name,postal_code,prefecture,city,ward,が存在すれば登録できること " do
        expect(@address).to be_valid
      end
    end

    context '配送先情報入力がうまくいかないとき' do
      it " last_nameがない場合は登録できないこと " do
        @address.last_name = nil
        @address.valid?
        expect(@address.errors[:last_name]).to include("を入力してください")
      end

      it " first_nameがない場合は登録できないこと " do
        @address.first_name = nil
        @address.valid?
        expect(@address.errors[:first_name]).to include("を入力してください")
      end

      it " phonetic_last_nameがない場合は登録できないこと " do
        @address.phonetic_last_name = nil
        @address.valid?
        expect(@address.errors[:phonetic_last_name]).to include("を入力してください")
      end

      it " phonetic_first_nameがない場合は登録できないこと " do
        @address.phonetic_first_name = nil
        @address.valid?
        expect(@address.errors[:phonetic_first_name]).to include("を入力してください")
      end

      it " postal_codeがない場合は登録できないこと " do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors[:postal_code]).to include("を入力してください")
      end

      it " prefectureがない場合は登録できないこと " do
        @address.prefecture_id = nil
        @address.valid?
        expect(@address.errors[:prefecture_id]).to include("を入力してください")
      end

      it " cityがない場合は登録できないこと " do
        @address.city = nil
        @address.valid?
        expect(@address.errors[:city]).to include("を入力してください")
      end

      it " wardがない場合は登録できないこと " do
        @address.ward = nil
        @address.valid?
        expect(@address.errors[:ward]).to include("を入力してください")
      end

      it " phonetic_last_nameが半角カナの場合は登録できないこと " do
        @address.phonetic_last_name = "ﾔﾏﾀﾞ"
        @address.valid?
        expect(@address.errors[:phonetic_last_name]).to include("は全角カタカナのみで入力して下さい")
      end

      it " phonetic_first_nameが半角カナの場合は登録できないこと " do
        @address.phonetic_first_name = "ｱﾔ"
        @address.valid?
        expect(@address.errors[:phonetic_first_name]).to include("は全角カタカナのみで入力して下さい")
      end

      it " last_nameが半角の場合は登録できないこと " do
        @address.last_name = "ﾔﾏﾀﾞ"
        @address.valid?
        expect(@address.errors[:last_name]).to include("は全角のみで入力して下さい")
      end

      it " first_nameが半角の場合は登録できないこと " do
        @address.first_name = "ｱﾔ"
        @address.valid?
        expect(@address.errors[:first_name]).to include("は全角のみで入力して下さい")
      end
    end
  end
end