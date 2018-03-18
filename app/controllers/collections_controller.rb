class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[show destroy update]
  def index
    @search_params = params[:search]
    @collections = Collection.all.page params[:page]
    @collections = @collections.where('name ILIKE ?', "%#{@search_params[:search]}%") if @search_params.present?
  end

  def new
    @collection = Collection.new
    gon.collection = @collection
  end

  def create
    @collection = Collection.new(collection_params)
    redirect_to collections_path if @collection.save
  end

  def destroy
    redirect_to collections_path if @collection.destroy
  end

  private

  def set_collection
    @collection = Collection.find(params[:id] || params[:collection_id])
  end

  def collection_params
    params.require(:collection).permit(:name)
  end
end
