# como já estou passando dentro do new, o objeto product ele já pega os metodos e atributos, usando diretamente
class ProductDecorator < SimpleDelegator
  include ActionView::Helpers::NumberHelper
  # ActionController::Base.helpers.number_to_currency <- inves de fazer assim, include, Helpers::NumberHelper, assim posso usar todos os metodos "NumberHelpers"

  def full_promo
    if promo?
      "<span class=\"text-muted text-decoration-line-through\">#{number_to_currency price}</span> #{number_to_currency promo_price}".html_safe
    else
      number_to_currency price
    end
  end
end
