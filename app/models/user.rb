class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 belongs_to :plan
 has_one :profile
 attr_accessor :stripe_card_token
  
  def save_with_payment
    if valid?
      # customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      customer = Stripe::Customer.create(:description => email, :metadata => {:plan => plan_id}, :source => stripe_customer_token) 
      self.stripe_customer_token = customer.id
      save!
    end
  end
end
