module Admin
  class ProductsController < BaseController
    before_action :set_category, only: %i[ show edit update destroy ]

    def index
      @products = Product.all
    end

    def edit # quando eu clico aqui ele chama "before_action" ali que tem o "set_category", lá em baixo ele faz get pelo parametro que vier
    end # quando clicar em salvar, aqui no edit, ele chama "update"

    def new
      authorize Product

      @product = Product.new
    # rescue Pundit::NotAuthorizedError #esse é o jeito "errado" eu fiz do outro jeito que é com "I18n" "jeito certo"
    #   flash[:notice] = "Você só pode cadastrar um produto se tiver uma categoria criada."
    #   redirect_to action: :index

    end # quando chegar aqui ele só está a instacia do product, quando criar em salvar ai sim ele chama 'create'

    def show;end

    def create
      @product = Product.new(product_params)
        if @product.save
          redirect_to admin_products_path(@product), notice: "product was successfully created."
        else
          render :new, status: :unprocessable_entity
        end
    end

    def update
        if @product.update(product_params)
          redirect_to admin_products_path(@product), notice: "product was successfully updated."
        else
          render :edit, status: :unprocessable_entity
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
      params.require(:product).permit(:name, :description, :price, :publish, :image, :category_id) # restringindo qual os campo pode vim aqui só esses são aceitos
    end
  end
end