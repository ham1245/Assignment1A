class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
    @items=Item.all
  end

  def show
    @lists= List.all
    @items=Item.all
  end

  def new
    @list = List.new
    @item = Item.new
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    if @list.save
        redirect_to (lists_path)
      else
        render :new
      end
  end

  def update
  end

  def destroy
    @list.destroy
      redirect_to lists_url
  end

  private
    def list_params
      params.require(:list).permit(:category)
      end

      def set_list
        @list = List.find(params[:id])
      end
end
