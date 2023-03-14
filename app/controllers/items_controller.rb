class ItemsController < ApplicationController
  before_action :authorize
  before_action :set_item, only: [:show, :update, :destroy]

  # LIST TASKS (GET: /items)
  def index
    @items = @task.Items.all
    render json: @items
  end

  # SHOW EACH TASKS (GET: /items/1)
  def show
    render json: @item
  end

  # NEW TASK (POST: /items)
  def create
    @item = Item.new(item_params.merge(Task: @task))

    if @item.save
      render json: @item, status: 200, location: @item # location: @item  : ???
    else
      render json: @item.errors, status: 422
    end
  end

  # UPDATE (PATCH/PUT: /items/1)
  def update
    if @item.update(item_params)
      render json: @item, status: 200
    else
      render json: @item.errors, status: 422
    end
  end

  # DELETE (DELETE: /items/1)
  def destroy
    if @item.destroy
      render json: { message: "Delete successful." }, status: 200
    else
      render json: @item.errors, status: 422
    end
  end

  private
    def set_item
      @item = @task.Items.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :deadline, :status)
    end
end
