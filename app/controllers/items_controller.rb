class ItemsController < ApplicationController
  before_action :set_item, only: %i[show update destroy]

  # GET /items
  def index
    @items = Item.includes(:user).all
    render json: @items.to_json(include: { user: { except: :password_digest } })
  end

  # GET /items/1
  def show
    render json: @item.to_json(include: { user: { except: :password_digest } })
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item.to_json(include: { user: { except: :password_digest } }), status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item.to_json(include: { user: { except: :password_digest } })
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :desc, :price, :image, :user_id)
  end
end
