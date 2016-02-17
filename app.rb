#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, 'sqlite3:pizzashop.db'

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

get '/order' do
	erb :order
end

# обработчик строки заказа
post '/cart' do
	order_products = params[:orders]
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
