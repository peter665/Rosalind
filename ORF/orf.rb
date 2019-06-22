require_relative "../RNA_into_Protein/rna_to_prot"
#load RNA to protein method with codon table of rna and protein pairs
require_relative "../DNA_to_RNA/dna_to_rna"
require_relative "../Complementing_DNA/compl_DNA"

str = File.read("input.txt").gsub("\n", "").scan(/(?<!>)[A-Z]+/)[0]

rna = dna_to_rna(str)
rna_r = dna_to_rna(compl_DNA(str))

orfs = []
orfs << rna.scan(/(?=(AUG(?:...)*?)(?=UAG|UGA|UAA))/)
orfs << rna_r.scan(/(?=(AUG(?:...)*?)(?=UAG|UGA|UAA))/)

puts orfs.flatten.uniq.map { |orf| rna_to_protein(orf, codon_table) }
