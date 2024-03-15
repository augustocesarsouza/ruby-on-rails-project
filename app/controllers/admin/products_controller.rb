module Admin
  class ProductsController < BaseController
    before_action :set_category, only: %i[ show edit update destroy ]

    def index
      @products = Product.all
    end

    def edit 
    end # quando clicar em salvar, aqui no edit, ele chama "update"

    def new
      @product = Product.new
    end # quando chegar aqui ele só está a instacia do product, quando criar em salvar ai sim ele chama 'create'

    def show;end

    def create
      @product = Product.new(product_params)

      respond_to do |format|
        if @product.save
          format.html { redirect_to admin_products_path(@product), notice: "product was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to admin_products_path(@product), notice: "product was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @product.destroy!

      respond_to do |format|
        format.html { redirect_to admin_products_path, notice: "product was successfully destroyed." }
      end
    end

    private

    def set_category
      @product = Product.find(params[:id]) # params estou pegando tudo que vem depois de "?" oque tiver tem como pegar
    end

    # Only allow a list of trusted parameters through.
    def product_params # autoriazado esse campo para "update, create" via submit
      params.require(:product).permit(:name, :description, :price, :publish, :category_id) # restringindo qual os campo pode vim aqui só esses são aceitos
    end
  end
end