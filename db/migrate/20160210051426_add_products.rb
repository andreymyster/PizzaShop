class AddProducts < ActiveRecord::Migration
  def change
        Product.create ({
            :title => 'Hawaiian',
            :description => 'Это гавайская пицца',
            :price => 350,
            :size => 30,
            :is_spicy => false,
            :is_veg => false,
            :is_best_offer => true,
            :path_to_image => '/images/Hawaiian.jpg'
        })

        Product.create ({
            :title => 'Pepperoni',
            :description => 'Отличная пепперони пицца',
            :price => 450,
            :size => 30,
            :is_spicy => true,
            :is_veg => false,
            :is_best_offer => false,
            :path_to_image => '/images/pepperoni.jpg'
        })

        Product.create ({
            :title => 'Vegetarian',
            :description => 'Крутая вегетарианская пицца',
            :price => 400,
            :size => 30,
            :is_spicy => false,
            :is_veg => true,
            :is_best_offer => false,
            :path_to_image => '/images/veg.jpg'
        })
  end
end
