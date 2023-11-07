module ShoppingItemsHelper
  def format_unit unit, stock
    case unit
      when 'db'
        number_with_precision(stock, precision: 0)
      else
        if stock == 0
          return number_with_precision(stock, precision: 0)
        end
        number_with_precision(stock, precision: 1)
    end
  end


end
