class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = policy_scope(Product)
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
   #@user = User.find(params[:user_id])
   @product = Product.new
   authorize @product
  end

  def edit
  end

  def create
    @product = current_user.products.build(product_params)
    authorize @product
    # we need `user_id` to asssociate product with corresponding user
respond_to do |format|
    if @product.save
      format.html { redirect_to @product, notice: 'Product was successfully created.' }
      format.json { render json: @product, status: :created, location: @product }
    else
      format.html { render action: "new" }
      format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
    if @product.update(product_params)
      format.html { redirect_to @product, notice: 'Product was successfully created.' }
      format.json { render json: @product, status: :created, location: @product }
    else
      format.html { render action: "new" }
      format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
       respond_to do |format|
      format.html { redirect_to product_url, notice: 'Product was successfully created.' }
      format.json { render json: no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
      authorize @product
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:category, :title, :description, :address, :price, :taille, :marque, :sexe, :etat, :couleur, :matiere, photos: [])
    #Mise en forme des Fonts sur les cards
      #parameters[:category] = parameters[:category].capitalize
      #parameters[:title] = parameters[:title].upcase
      #parameters[:description] = parameters[:description].downcase
      #return parameters
    end
end
