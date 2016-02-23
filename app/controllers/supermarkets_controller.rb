class SupermarketsController < ApplicationController
  layout :resolve_layout

  def supermarkets
  end

  def categories
  end

  def buy
  end

  private

  def resolve_layout
    case action_name
    when 'supermarkets'
        'supermarkets'
    when 'categories'
        'categories'
    end
  end

end
