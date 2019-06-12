File.open("result.txt","w") do |res|
  data = File.read('input.txt').scan(/([ACGT]+)(.+)/m).flatten.map {|e| e.gsub "\n", ''}
  str = data[0].split('')
  prob = data[1].split(' ').map(&:to_f)

  prob.each do |p|
    s = str
    gc = p/2
    at = (1-p)/2
    res << '%.3f' % Math.log(
           s.map { |char| char == "C" || char == "G" ? gc : at }
           .reduce(&:*),
           10)
    res << ' '
  end
end
