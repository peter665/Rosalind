
File.open('result.txt','w') do |res|
  f = File.read('input.txt')
  dna_strs = f.gsub("\n","").scan(/(?<!\>)[A-Z]+(?!\>)/)

  start = 0
  longest = 'A'
  size = dna_strs.first.size

  while start < size
    (start+1).upto(size) do |i|
      search_str = dna_strs.first[start..i-1]

      str_length = search_str.length

      longest = search_str if (search_str.size > longest.size) &&
      dna_strs[1..-1].all? { |e| e.include? search_str  }

    end
    start+=1
  end  
    res << longest
end
