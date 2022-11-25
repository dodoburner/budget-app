class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[show edit update destroy]

  # GET /purchases or /purchases.json
  def index
    @purchases = Group.find(params[:group_id]).purchases
    @total_amount = 0

    @purchases.each do |purchase|
      @total_amount += purchase.amount
    end
  end

  # GET /purchases/new
  def new
    @group = Group.find(params[:group_id])
    @groups = Group.where(user_id: current_user.id)
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit; end

  # POST /purchases or /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)
    @groups = Group.where(id: groups_params['groups'])
    @purchase.groups << @groups
    @purchase.author = current_user

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to group_purchases_path, notice: 'Purchase was successfully created.' }
        format.json { render :new, status: :created, location: @purchase }
      else
        format.html { redirect_to new_group_purchase_path, alert: 'Failed to create purchase.' }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1 or /purchases/1.json
  # def update
  #   respond_to do |format|
  #     if @purchase.update(purchase_params)
  #       format.html { redirect_to purchase_url(@purchase), notice: "Purchase was successfully updated." }
  #       format.json { render :show, status: :ok, location: @purchase }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @purchase.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /purchases/1 or /purchases/1.json
  def destroy
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to group_purchases_path, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def purchase_params
    params.require(:purchase).permit(:name, :amount)
  end

  def groups_params
    params.require(:purchase).permit(groups: [])
  end
end
