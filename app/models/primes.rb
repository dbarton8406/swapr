class Primes
  def divides?(a, b)
    remainder = a % b
    remainder.zero?
  end

  def find_divisor(number, guess)
    if guess ** 2 > number
      number
    elsif divides?(number, guess)
      guess
    else
      find_divisor(number, guess + 1)
    end
  end

  def smallest_divisor(number)
    find_divisor(number, 2)
  end

  def prime?(number)
    number == smallest_divisor(number)
  end

  def next_prime(initial)
    number = initial + 1
    until prime?(number)
      number += 1
    end
    number
  end

  def nth_prime(n, start=1)
    number = start
    n.times do
      number = next_prime(number)
    end
    number
  end
end
