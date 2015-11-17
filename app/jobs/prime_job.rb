class PrimeJob < ActiveJob::Base
  queue_as :default

  def perform(user, count)
    primer = Primes.new
    result = primer.nth_prime(count.to_i)
    WelcomeMailer.prime(user, count, result)
  end
end
