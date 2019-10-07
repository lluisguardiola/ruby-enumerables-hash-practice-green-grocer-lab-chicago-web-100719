def consolidate_cart(cart)
  new_cart = {}
  
  cart.each do |hash|
    hash.each do |item, attribute|
      new_cart[item] = attribute if !new_cart[item]
      
      if new_cart[item][:count]
        new_cart[item][:count] += 1
      else
        new_cart[item][:count] = 1
      end
      
    end
  end
  return new_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item = coupon[:item]
    coupon_item = "#{item.upcase} W/ COUPON"
    
    if cart[item] && cart[item][:count] >= coupon[:num]
      if cart[coupon_item]
        cart[coupon_item][:count] += coupon[:num]
      else
        cart[coupon_item] = {price: coupon[:cost] / coupon[:num], clearance: cart[item][:clearance], count: coupon[:num]}
      end
    else
      return cart
    end
    cart[item][:count] -= coupon[:num]
  end
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
