File.open("result.txt","w") do |res|
  result = []
  data = File.read('input.txt').gsub("\n",'').scan(/(Rosalind_\d+)([A-Z]+)/)

  data.each {|k,v| data.each {|k2,v2| result << [k,k2] if v[-3..-1] == v2[0..2]}}
  result.reject {|a,b| a == b}.each do |arr|
    res << arr.join(' ')
    res << "\n"
  end
end
