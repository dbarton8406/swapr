class PrimeJob < ActiveJob::Base
  queue_as :default

  def perform(user, count)
    primer = Primes.new
    result = primer.nth_prime(count)
    WelcomeMailer.prime(user, count, result)
  end
end
