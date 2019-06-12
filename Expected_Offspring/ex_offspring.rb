File.open("result.txt","w") do |res|
  prob = [1, 1, 1, 0.75, 0.5, 0]
  input = File.read("input.txt").chomp.split.map(&:to_i)
  res << 2 * prob.zip(input).reduce(0) { |m,(a,b)| m += a * b}
end
