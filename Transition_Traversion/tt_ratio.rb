dna1, dna2 = File.read("input.txt").gsub("\n",'').scan(/(?<!>)[A-Z]+/)

def tt_ratio(dna1, dna2)
  transition = 0.0
  transversion = 0.0
  trans = [["A", "G"], ["C", "T"]]

  (dna1.chars).zip(dna2.chars).reject { |a,b| a == b }
  .each  do |e|
    trans.include?(e.sort) ? transition +=1 : transversion += 1
  end

  transition/transversion
end

puts tt_ratio(dna1, dna2).round(11)
