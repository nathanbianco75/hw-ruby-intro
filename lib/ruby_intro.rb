# When done, submit this entire file to the autograder.


# Part 1

def sum arr
  if arr.empty?
    return 0
  end
  
  sum = 0
  arr.each { |num| sum += num }
  sum
end

def max_2_sum arr
  if arr.empty?
    return 0
  elsif arr.length == 1
    return arr[0]
  end
  
  largest = [arr.min, arr.min]
  arr.each do |num|
    # iterate through largest - allows for any size largest
    # largest's elems get stored largest to smallest - left to right
    largest.map! do |larg|
      if num > larg
        tmp = num
        num = larg
        larg = tmp
      end
      larg = larg
    end
  end
  sum largest
end

def sum_to_n? arr, n
  if arr.empty? or arr.length == 1
    return false
  end
  
  (0..arr.length-1).each do |i|
    (i+1..arr.length-1).each do |j|
      if arr[i] + arr[j] == n
        return true
      end
    end
  end
  false
end


# Part 2

def hello(name)
  "Hello, " + name
end

def starts_with_consonant? s
  if s.empty? or not s =~ /^[bcdfghjklmnpqrstvwxyz]/i
    return false
  else
    return true
  end
end

def binary_multiple_of_4? s
  if s.empty?
    return false
  end
  
  len = s.length-1
  num = 0
  (0..len).each do |i|
    if s[i] == '1'
      num += 2**(len - i)
    elsif s[i] != '0'
      return false
    end
  end
  
  if num % 4 == 0
    return true
  else
    return false
  end
end


# Part 3

class BookInStock
  
  def initialize(isbn, price)
    if isbn.empty? or price <= 0
      raise(ArgumentError)
    end
    @isbn = isbn
    @price = price
  end
  
  attr_accessor :isbn
  attr_accessor :price
  
  def price_as_string()
    str = "$"
    price_str = @price.to_s
    
    rem = -1
    (0..price_str.length-1).each do |i|
      if rem == 0
        break
      elsif price_str[i] == '.'
        rem = 2
      elsif rem > 0
        rem -= 1
      end
      str += price_str[i]
    end
    
    if rem == -1 or rem == 2
      str += ".00"
    elsif rem == 1
      str += "0"
    end
    
    return str
  end
  
end