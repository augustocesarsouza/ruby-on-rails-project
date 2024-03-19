module ProductsHelper
  def display_price(product)
    if product.promo?
      content_tag(:div) do
        content_tag(:span, number_to_currency(product.price), class: "text-muted text-decoration-line-through") + " " + 
        content_tag(:span, number_to_currency(product.promo_price))
      end
    else
      content_tag(:span, number_to_currency(product.price))
    end
  end
end  


