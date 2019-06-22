require_relative "../codon_table" #load the codon table of protein and rna pairs

 # str = File.read("input.txt").chomp

def rna_to_protein(rna, pairs)
  result = ""
  rna.chars.each_slice(3) do |el|
    codon = el.join
    pairs.find do |rna, amino|
      break if (rna == codon && amino == "Stop")
      result << amino if rna == codon
    end
  end
   result
end


 # puts rna_to_protein(str, codon_table)
