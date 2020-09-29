class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_parents
  
  def index
    @products = Product.includes(:images).order('created_at DESC')
    @product = Product.all.order("created_at DESC").limit(10)
    @brand = Product.where(brand: 'ロレックス').order("created_at DESC").limit(10)
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end  

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: '出品しました'
    else
      @product.images.new
      render :new, notice: '出品に失敗しました'
    end
  end
  
  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: '更新しました'
    else
      render 'edit'
    end
  end

  def show
    @favorite = Favorite.find_by(user_id: current_user.id, product_id: @product.id)
    @condition = Condition.find(@product.condition_id)
    @shipping_cost = ShippingCost.find(@product.shipping_cost_id)
    @prefecture = Prefecture.find(@product.prefecture_id)
    @shipment_date = ShipmentDate.find(@product.shipment_date_id)
  end

  def destroy
    if @product.destroy
      redirect_to root_path, notice: '出品を削除しました'
    else
      redirect_to root_path, alert: "削除が失敗しました"
    end
  end

  def purchase
    @address = DeliveryAddress.where(user_id: current_user.id).first
    @product = Product.find(params[:id])
    @card = Card.where(user_id: current_user.id).first

    if @card.present?
      # 登録している場合,PAY.JPからカード情報を取得する
      # PAY.JPの秘密鍵をセットする。
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # PAY.JPから顧客情報を取得する。
      customer = Payjp::Customer.retrieve(@card.customer_id)
      # PAY.JPの顧客情報から、デフォルトで使うクレジットカードを取得する。
      @card_info = customer.cards.retrieve(customer.default_card)
      # クレジットカード情報から表示させたい情報を定義する。
      # クレジットカードの画像を表示するために、カード会社を取得
      @card_brand = @card_info.brand
      # クレジットカードの有効期限を取得
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 

      # クレジットカード会社を取得したので、カード会社の画像をviewに表示させるため、ファイルを指定する。
      case @card_brand
      when "Visa"
        @card_image = "creditcards/visa_1.svg"
      when "JCB"
        @card_image = "creditcards/jcb.svg"
      when "MasterCard"
        @card_image = "creditcards/master-card.svg"
      when "American Express"
        @card_image = "creditcards/american_express.svg"
      when "Diners Club"
        @card_image = "creditcards/diners.svg"
      when "Discover"
        @card_image = "creditcards/discover.svg"
      end
    end
  end

  def pay
    @product = Product.find(params[:id])
    @card = Card.where(user_id: current_user.id).first

    if current_user.cards.present?
      # ログインユーザーがクレジットカード登録済みの場合の処理
      # ログインユーザーのクレジットカード情報を引っ張ってくる
      @card = Card.find_by(user_id: current_user.id)
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #登録したカードでの、クレジットカード決済処理
      Payjp::Charge.create(
      # 商品(product)の値段を引っ張ってきて決済金額(amount)に入れる 
      amount: @product.price,
      customer: @card.customer_id,
      currency: 'jpy',
      )
    else
      # ログインユーザーがクレジットカード登録されていない場合(Checkout機能による処理を行います)
      # APIの「Checkout」ライブラリによる決済処理の記述
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp::Charge.create(
      amount: @product.price,
      card: params['payjp-token'],
      currency: 'jpy'
      )
    end 

    if @product.update(buyer_id: current_user.id)
      flash[:notice] = '購入しました'
      redirect_to controller: 'products', action: 'show', id: @product.id
    else
      flash[:alert] = '購入に失敗しました'
      redirect_to controller: 'products', action: 'show', id: @product.id
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :price, 
      :brand,
      :condition_id, 
      :shipping_cost_id, 
      :shipment_date_id, 
      :prefecture_id, 
      :category_id, 
      images_attributes: [:image, :_destroy, :id]
      )
      .merge(seller_id: current_user.id)
  end

  def find_product
    @product = Product.includes(:images).find(params[:id])
  end

end
