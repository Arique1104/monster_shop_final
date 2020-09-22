class Merchant::BulkDiscountController < Merchant::BaseController
  def index
    @bulk_discounts = BulkDiscount.all
  end

  def show
    @bulk_discount = BulkDiscount.find(secure_params[:id])
  end

  def update
    @bulk_discount = BulkDiscount.find(params[:id])
    @bulk_discount.update(active: params[:new_status])
    redirect_to "/merchant/bulk_discounts/#{@bulk_discount.id}"
  end

  private
  def secure_params
    params.permit(:id, :name, :percent_discount, :min_purchase)
  end
end
