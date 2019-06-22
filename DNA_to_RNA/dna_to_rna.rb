# str = File.read("input.txt").chomp

def dna_to_rna(dna)
  dna.gsub("T", "U")
end

# puts dna_to_rna(str)
