# Jungle

A mini e-commerce application built with Rails 4.2 PostgreSQL as database.

## Setup

1. Clone the repository
2. Run `bundle install` to install dependencies
3. Run bin/rake db:reset to create, load and seed db
4. Run `bin/rails s -b 0.0.0.0` to start the server
5. Open http://localhost:3000 on your browser

!["1"](https://github.com/jitammy/jungle-rails/blob/master/screenshots/main.png)
!["2"]()
!["3"](https://github.com/jitammy/jungle-rails/blob/master/screenshots/Order.png)
!["4"](https://github.com/jitammy/jungle-rails/blob/master/screenshots/orderconfirm.png)
!["5"](https://github.com/jitammy/jungle-rails/blob/master/screenshots/emptycart.png)
!["6"](https://github.com/jitammy/jungle-rails/blob/master/screenshots/admin.png)
!["7"](https://github.com/jitammy/jungle-rails/blob/master/screenshots/admin_cat.png)
!["8"](https://github.com/jitammy/jungle-rails/blob/master/screenshots/admin_prod.png)
!["9"](https://github.com/jitammy/jungle-rails/blob/master/screenshots/func_review1.png)
!["10"](https://github.com/jitammy/jungle-rails/blob/master/screenshots/func_review2.png)

## Order Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
