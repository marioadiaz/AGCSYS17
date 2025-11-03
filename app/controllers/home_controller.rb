class HomeController < ApplicationController
  def index
    # Si quisieras pasar datos dinámicos al multiselect:
    #
    @ingredientes = ["Cheese", "Tomatoes", "Mozzarella", "Mushrooms", "Pepperoni", "Onions"]
    
  end
end
