class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    # ?pour ordonner les produits par category    @products = Product.order(:category)

    # pour la searchbar
      if params[:search]
        @products = Product.search(params[:search]).order("created_at DESC")
      else
        @products = Product.all.order('created_at DESC')
      end
    #pour le geocoder
      @products = Product.where.not(latitude: nil, longitude: nil)
    #pour le geocoder
      @hash = Gmaps4rails.build_markers(@products) do |product, marker|
      marker.lat product.latitude
      marker.lng product.longitude
    end
  end

  def show
    @product_coordinates = { lat: @product.latitude, lng: @product.longitude }
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.create(product_params)
      if @product.save
      redirect_to_product_path(@product)
      else
      render :new
      end
  end

  def update
    @product.update(params[:product])
    redirect_to_product_path
  end

  def destroy
    @product.destroy
      redirect_to product_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:category, :title, :description, :address, :price, :taille, :marque, :sexe, :etat, :couleur, :matiere, photos: [])
    #Mise en forme des Fonts sur les cards
      parameters[:category] = parameters[:category].capitalize
      parameters[:title] = parameters[:title].upcase
      parameters[:description] = parameters[:description].downcase
      return parameters
    end
end
