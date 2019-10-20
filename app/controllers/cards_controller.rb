class CardsController < ApplicationController

  protect_from_forgery except: [:pay,:payjp] 

  
  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
     redirect_to index: :cards
     else
     render :new
     end
   end

   def payjp ##トークンを取得保存、トークンを活用して顧客を作成して保存
    respond_to do |format|
    format.json {
      require 'payjp'
      Payjp.api_key = 'sk_test_bdb970cac750a6369f0f97fd'
      response_customer = Payjp::Customer.create(card: params[:token])
        if current_user.card
        current_user.card.update(token: params[:token] , customer_id: response_customer.id , user_id:current_user.id)
        else
        Card.create(token: params[:token], customer_id: response_customer.id , user_id:current_user.id)
        end
       @card = current_user.card
      }
    end
  end
  
  def pay ##支払いの時にトークンと支払い金額をpayjpに渡す
    
    token =Payjp::Token.create(
      :card => {
      :number => params[:number],
      :cvc => params[:cvc],
      :exp_month => params[:exp_month],
      :exp_year => params[:exp_year]
    }
  )
  
      charge = Payjp::Charge.create(
        :amount => 10000,
        :card => token.id,
        :currency => 'jpy',
      )
  end
  
  private
  def card_params
    params.require(:card).permit(:card_number, :expiration_date, :security_cord).merge(user_id: current_user.id)
  end
  





  # def pay
    #  Payjp.api_key = 'sk_test_bdb970cac750a6369f0f97fd'

  #    if params['payjp-token'].blank?
  #     redirect_to action: "new"
  #   else
  #     customer = Payjp::Customer.create(
  #     description: '登録テスト', #なくてもOK
  #     email: current_user.email, #なくてもOK
  #     card: params['payjp-token'],
  #     metadata: {user_id: current_user.id}
  #     ) #念の為metadataにuser_idを入れましたがなくてもOK
  #     @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
  #     if @card.save
  #       redirect_to action: "show"
  #     else
  #       redirect_to action: "pay"
  #     end
  #   end


#     token =Payjp::Token.create(
#     :card => {
#     :number => params[:number],
#     :cvc => params[:cvc],
#     :exp_month => params[:exp_month],
#     :exp_year => params[:exp_year]
#   }
# )

#     charge = Payjp::Charge.create(
#       :amount => 10000,
#       :card => token.id,
#       :currency => 'jpy',
#     )

#     redirect_to "/cards/new"

#     flash[:notice] = "支払い完了"

  # end

end
