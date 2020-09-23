class Merchant::BulkDiscountController < Merchant::BaseController

  def new

  end

  def create
    @discount = BulkDiscount.new(name: secure_params[:name], percent_discount: secure_params[:percent_discount], min_purchase: secure_params[:min_purchase], merchant_id: current_user.merchant_id)

    if @discount.save
      redirect_to "/merchant/bulk_discounts"
    else
      flash[:notice] = "Please try again"
      render :new
    end
  end

  def index
    @bulk_discounts = BulkDiscount.all
  end

  def show
    @bulk_discount = BulkDiscount.find(secure_params[:id])
  end

  def update
    @bulk_discount = BulkDiscount.find(params[:id])

    if secure_params[:name] != ""
    @bulk_discount.update(name: secure_params[:name])
    end

    if secure_params[:percent_discount] != ""
      @bulk_discount.update(percent_discount: secure_params[:percent_discount])
    end

    if secure_params[:min_purchase] != ""
      @bulk_discount.update(min_purchase: secure_params[:min_purchase])
    end
    redirect_to "/merchant/bulk_discounts/#{@bulk_discount.id}"
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
