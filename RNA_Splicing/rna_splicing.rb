#loading methods from previous solutions
require_relative "../RNA_into_Protein/rna_to_prot"
require_relative "../codon_table"
require_relative "../DNA_to_RNA/dna_to_rna"

dna, *introns = File.read("input.txt").gsub("\n", '').scan(/(?<!>)([A-Z]+)/).flatten

introns.map! { |intron| dna_to_rna(intron) }

def rna_splice(rna, introns)
  introns.each do |intron|
    rna.gsub!(intron, "")
  end
  rna
end

rna = dna_to_rna(dna)

puts rna_to_protein(rna_splice(rna, introns), codon_table)
