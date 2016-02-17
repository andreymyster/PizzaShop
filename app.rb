#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, 'sqlite3:pizzashop.db'

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
	# валидация - эти поля должны быть не пустыми
	validates :name, presence: true, length: {minimum: 3}
	validates :address, presence: true
	validates :tel, presence: true, length: {minimum: 7}
end

get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

get '/order' do
	@ord = Order.new
	erb :order
end

# обработчик строки заказа
post '/cart' do
	order_products = params[:orders]
	# сохраняем переменную для записи в бд при оформлении
	$OP = order_products
	# удаляем лишнее из строки
	order_products = order_products.delete 'product_'
	@order={}
	@products = Product.all
	# разделяем строку через пробелы и в хеш записываем значения вокруг знака =
	# 1=5 - 5 пицц типа 1
	order_products.split.each do |item|
	 	aa = item.split('=')
		@order[aa[0].to_i] = aa[1].to_i
	end
	erb :cart
end

# обработка страницы заказа
post '/order' do
	# сохраняем переменные в БД
	@ord = Order.new params[:order]
	@ord.list_order = $OP
	@ord.sum = $sum
	@ord.save

	# проверка - произошла ли запись в бд
	if @ord.save
		erb 'Спасибо за покупку!'
	else
		@error = @ord.errors.full_messages.first
		erb :order
	end

end
