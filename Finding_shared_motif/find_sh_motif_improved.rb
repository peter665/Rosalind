File.open('result.txt','w') do |res|
  f = File.read('input.txt')
  dna_strs = f.gsub("\n","").scan(/(?<!\>)[A-Z]+(?!\>)/)

  str = dna_strs.sort.first
  size = str.size
  found = false

  until found
      str.chars.each_cons(size) do |subarr|
        s = subarr.join
        if dna_strs[1..-1].all? { |e| e.include? s }
          res << s
          found = true
        end
      end
    size -= 1
  end
end
