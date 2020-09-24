class Merchant::BulkDiscountController < Merchant::BaseController

  def new

  end

 def create
    merchant = current_user.merchant
    @discount = merchant.bulk_discounts.new(secure_params)

    if @discount.save
      flash[:notice] = "Discount successfully created"
      redirect_to "/merchant/bulk_discounts"
    else
      flash[:notice] = "Please try again"
      render :new
    end
  end

  def index
    @bulk_discounts = current_user.merchant.bulk_discounts
  end

  def show
    @bulk_discount = BulkDiscount.find(secure_params[:id])
  end

  def update
    @bulk_discount = BulkDiscount.find(params[:id])
    @bulk_discount.update_attributes(secure_params)
      if @bulk_discount.save
        flash[:notice] = "Your discount has been successfully updated!"
        redirect_to "/merchant/bulk_discounts/#{@bulk_discount.id}"
      else
        generate_flash(@bulk_discount)

        render :edit
      end
  end

  def edit
    @bulk_discount = BulkDiscount.find(params[:id])
  end

  def update_status
    @bulk_discount = BulkDiscount.find(params[:id])
    @bulk_discount.update(active: params[:new_status])
    redirect_to "/merchant/bulk_discounts/#{@bulk_discount.id}"
  end

  def destroy
    BulkDiscount.destroy(params[:id])
    redirect_to "/merchant/bulk_discounts"
  end

  private
  def secure_params
    params.permit(:id, :name, :percent_discount, :min_purchase)
  end

end
