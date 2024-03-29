 # testar depois tirar esse module para ver se funciona a validação do "BaseController" sem esse module Admin
 module Admin
  class CategoriesController < BaseController
    before_action :set_category, only: %i[ show edit update destroy ]

    # GET /categories or /categories.json
    def index
      @categories = Category.all
    end

    # GET /categories/1 or /categories/1.json
    def show # chama "before_action" "set_category"
    end

    # GET /categories/new
    def new # esse "def new" é a action new
      @category = Category.new
    end

    # GET /categories/1/edit
    def edit # quando eu clico aqui ele chama "before_action" ali que tem o "set_category", lá em baixo ele faz get pelo parametro que vier
    end

    # POST /categories or /categories.json
    def create
      @category = Category.new(category_params)
        if @category.save
          redirect_to admin_categories_path(@category), notice: "Category was successfully created." 
        else
          render :new, status: :unprocessable_entity 
        end
    end

    # PATCH/PUT /categories/1 or /categories/1.json
    def update
      if @category.update(category_params)
        redirect_to admin_categories_path(@category), notice: "Category was successfully updated." 
      else
        render :edit, status: :unprocessable_entity 
      end
    end

    # DELETE /categories/1 or /categories/1.json
    def destroy
      @category.destroy!

      respond_to do |format|
        format.html { redirect_to admin_categories_path, notice: "Category was successfully destroyed." }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def category_params
        params.require(:category).permit(:name, :position) # restringindo qual os campo pode vim aqui só esses são aceitos
      end
  end
end