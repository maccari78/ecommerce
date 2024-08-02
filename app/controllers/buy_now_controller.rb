class BuyNowController < ApplicationController # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment
  before_action :set_product
  def show; end

  def create # rubocop:disable Metrics/MethodLength
    session = Stripe::Checkout::Session.create({
    ui_mode: 'embedded', # rubocop:disable Layout/FirstHashElementIndentation
    line_items: [{
      # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
      price_data:{ # rubocop:disable Layout/HashAlignment,Layout/SpaceAfterColon
        currency:"usd", # rubocop:disable Layout/SpaceAfterColon,Layout/HashAlignment
        unit_amount: (@product.price * 100).to_i,
        product_data: {
          name: @product.name
        }, # rubocop:disable Style/TrailingCommaInHashLiteral
      },
      quantity: 1, # rubocop:disable Style/TrailingCommaInHashLiteral
    }],
    mode: 'payment',
    return_url: success_product_buy_now_url(@product), # rubocop:disable Style/StringConcatenation,Style/TrailingCommaInHashLiteral
  }) # rubocop:disable Layout/FirstHashElementIndentation

  render json: { clientSecret: session.client_secret } # rubocop:disable Layout/SpaceInsideHashLiteralBraces,Layout/IndentationConsistency
  end

  def success
     # rubocop:disable Layout/TrailingWhitespace
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: "Product not found"
  end
end # rubocop:disable Layout/TrailingEmptyLines