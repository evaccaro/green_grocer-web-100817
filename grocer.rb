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

  cart.each do |item, info|
    if coupons[:item] == item
      info[:count] = info[:count] - coupons[:num]
    end
  end
  cart["#{coupons[:item]} W/COUPON"] = {:price => coupons[:cost], :clearance => cart[coupons[:item]][:clearance], :count => 1}

  cart.each do |item, info|
    if info[:count] == 0
      cart.delete(item)
    end
  end
    cart 
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
