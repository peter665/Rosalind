table = {}

File.open('table.txt') do |f|
  f.each do |line|
    match = line.match(/([A-Z])\s+(\d+\.\d+)/)
    table[match[1]] = match[2].to_f
  end
end

File.open('result.txt','w') do |res|
  File.open('input.txt') do |f|
    f.each do |line|
      res <<  line.chomp.chars.map { |c| table[c] }.reduce(:+)
    end
  end
end
