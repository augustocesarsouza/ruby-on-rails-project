module Admin
  class BaseController < ApplicationController
    layout 'admin' # trocando porque por padrão ele usar leyaout application, com esse "layout" conseguimos configurar nosso layout
  end
end
