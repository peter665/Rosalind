k, n = File.read("input.txt").split(' ').map(&:to_i)
# t = number of trials ( count in the k-th generation)
# n = number of successes

def fac n
  return 1 if n == 1 || n == 0
  n * fac(n - 1)
end

def ind_allelles(k, n)
  t = 2**k
  prob = 0
  (n..t).each do |i|

    prob += (fac(t) / (fac(i) * fac(t-i))) * (0.25**i) * (0.75**(t-i))
    puts "probability for #{i} = #{prob}"
  end
  puts '%.3f' % prob
end

ind_allelles(k, n)
