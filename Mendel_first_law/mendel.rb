def mendel(dom,het,rec)
  total     = dom + het + rec
  p_het     = het / total * (het-1) / (total-1) * 0.25
  p_rec     = rec / total * (rec-1) / (total-1)
  p_het_rec = (het / total * rec / (total-1) + rec/total * het/(total-1)) * 0.5

  result = 1 - p_het - p_rec - p_het_rec
end

File.open("result.txt","w") do |res|
  File.open("input.txt", "r") do |f|
    dom, het, rec =  f.readline.chomp.split(' ').map(&:to_f)
    puts dom,het,rec
    res << mendel(dom,het,rec)
  end
end
