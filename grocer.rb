def consolidate_cart(cart)
  new_cart = {}
  temp = cart.each_with_object(Hash.new(0)) { |item,counts| counts[item] += 1 }
    temp.each do |item, count|
      item.each do |name, info|
        new_cart[name] = info
        info[:count] = count
      end
    end
    new_cart
end

def apply_coupons(cart, coupons)
  if cart.include?(coupons[0][:item])
    if cart[coupons[0][:item]][:count] == coupons[0][:num]
      cart["#{coupons[0][:item]} W/COUPON"] = {:price => coupons[0][:cost], :clearance => cart[coupons[0][:item]][:clearance], :count => 1}
      cart.delete(coupons[0][:item])
    else
      cart[coupons[0][:item]][:count] = cart[coupons[0][:item]][:count] - coupons[0][:num]
      cart["#{coupons[:item]} W/COUPON"] = {:price => coupons[0][:cost], :clearance => cart[coupons[0][:item]][:clearance], :count => 1}
  end
end
    cart
end

def apply_clearance(cart)
  cart.each do |item, info|
    if info[:clearance]
      info[:price] = info[:price] * .80
    end
end

def checkout(cart, coupons)
  # code here
end
