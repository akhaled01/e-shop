class CartsController < ApplicationController
  before_action :set_cart, only: %i[show update destroy]

  # GET /carts
  def index
    @carts = Cart.all
    render json: @carts.to_json(include: :items)
  end

  # GET /carts/1
  def show
    render json: @cart.to_json(include: :items)
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      render json: @cart.to_json(include: :items), status: :created, location: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # POST /carts/1/add_item
  def add_item
    item = Item.find(params[:item_id])
    quantity = params[:quantity].to_i
    @cart.add_item(item, quantity)
    if @cart.save
      render json: @cart.to_json(include: :items), status: :ok
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # POST /carts/1/remove_item
  def remove_item
    item = Item.find(params[:item_id])
    @cart.remove_item(item)
    if @cart.save
      render json: @cart.to_json(include: :items), status: :ok
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      render json: @cart.to_json(include: :items)
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
    head :no_content
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:name, item_ids: [])
  end
end
