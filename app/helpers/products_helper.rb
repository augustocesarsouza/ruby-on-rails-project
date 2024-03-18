module ProductsHelper
  def display_price(product)
    if product.promo?
      content_tag(:span, class: "text-muted text-decoration-line-through") do
        number_to_currency(product.price)
      end + " " +
      content_tag(:span) do
        number_to_currency(product.promo_price)
      end
    else
      number_to_currency(product.price)
    end
  end
end  


