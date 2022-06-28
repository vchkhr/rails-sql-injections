class OrdersController < ApplicationController
  def regenerate
    Order.all.destroy_all
    10.times { User.create(name: Faker::Name.name, is_admin: User.all.count == 3) } if User.all.empty?
    10.times { Order.create(user: User.first, total: Faker::Number.within(range: 1..2000)) }

    redirect_back(fallback_location: root_path)
  end

  def destroy_all
    Order.destroy_all

    redirect_back(fallback_location: root_path)
  end

  def joins
    order_search = Order.joins(params[:table]).where("total > 1000").all

    render turbo_stream: turbo_stream.replace(:orders, partial: "orders/orders", locals: { orders: order_search })
  end

  def joins_sanitized
    order_search = Order.joins( ActiveRecord::Base.connection.quote_column_name( params[:table] ) ).where("total > 1000").all
    order_search = Order.joins("INNER JOIN users ON users.#{ActiveRecord::Base.connection.quote_column_name(params[:column])} = orders.user_id").where("total > 1000").all
    render turbo_stream: turbo_stream.replace(:orders, partial: "orders/orders", locals: { orders: order_search })
  end
end
