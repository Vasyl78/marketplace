class ItemsController < ApplicationController
  before_action :set_item, only: %i[show update destroy]

  def index
    if params[:page] && params[:page][:number]
      @items = Item.paginate(page: params[:page][:number], per_page: 5)
      total_pages = (Item.count / 10).ceil
      current_page = params[:page][:number]
    else
      @items = Item.all
      current_page = 1
    end

    pagination = {
      current_page:  current_page,
      last_page:     total_pages,
      next_page_url: "#{items_path}?page[number]=#{current_page.to_i + 1}",
      prev_page_url: "#{items_path}?page[number]=#{current_page.to_i - 1}"
    }

    render json: { items: @items, pagination: pagination }
  end

  def create
    @item = Item.create!(todo_params)
    render json: @item, status: :created
  end

  def show
    render json: @item, status: :ok
  end

  def update
    @item.update(item_params)
    head :no_content
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def todo_params
    params.permit(:name, :user_id)
  end

  def set_todo
    @item = Item.find(params[:id])
  end
end
