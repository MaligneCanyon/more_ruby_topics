# inputs:
# - int
# outputs:
# - arr
# reqs:
# - take a pos int (num)
# - rtn a list of all divisors of the num (preferably sorted)
# rules:
# - none
# struct:
# - arr
# algo:
# - init an arr to [1, num]
# - for each n from 2 to Math.sqrt(num).floor
#   - if n divides evenly into the int
#     - add n and the quotient to the arr
# - flatten, sort, and rtn the unique arr values

def divisors(num)
  arr = [1, num]
  (2..Integer.sqrt(num)).each do |n|
    quot, rem = num.divmod(n)
    arr << [n, quot] if rem.zero?
  end
  # p arr
  arr.uniq.flatten.sort
end

def time_it
  time_before = Time.now
  yield # execute the implicit block
  time_after= Time.now
  puts "It took #{time_after - time_before} seconds"
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357) == [1, 999979, 999983, 999962000357]

time_it { divisors(999962000357) } # It took 0.296222437 seconds
