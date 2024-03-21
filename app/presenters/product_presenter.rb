# como já estou passando dentro do new, o objeto product ele já pega os metodos e atributos, usando diretamente
class ProductPresenter < SimpleDelegator
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::TagHelper
 
  # include ActionView::Context # isso quando usar 'content_tag' buffer gigante, quando usa block
  # ActionController::Base.helpers.number_to_currency <- inves de fazer assim, include, Helpers::NumberHelper, assim posso usar todos os metodos "NumberHelpers"

  def price
    # if promo?
    #   content_tag(:div) do
    #     content_tag(:span, number_to_currency(price), class: "text-muted text-decoration-line-through") + " " + 
    #     content_tag(:span, number_to_currency(promo_price))
    #   end
    # else
    #   content_tag(:span, number_to_currency(price))
    # end

    # super -> aqui o nome do metodo 'price' quando ele bater 'if promo?' ele já chama no 'super' o atributo do 'product' 'price' e coloca ali no lugar do super
    # isso só é possivel por causa do 'SimpleDelegator', nessa hora '|p| ProductDecorator.new(p)', tem que ser mesmo nome do metodo aqui e do atributo ou metodo do product
    # 'super' ele chama e executa da class 'pai' que ele tem de herança, que seria por causa do 'SimpleDelegator' essa funcionalidade
    return content_tag(:span, number_to_currency(super), class: 'text-muted text-decoration-line-through') + " #{number_to_currency(promo_price)}" if promo?

    number_to_currency(super)


    # if promo?
    #   "<span class=\"text-muted text-decoration-line-through\">#{number_to_currency price}</span> #{number_to_currency promo_price}".html_safe
    # else
    #   number_to_currency price
    # end
  end
end
