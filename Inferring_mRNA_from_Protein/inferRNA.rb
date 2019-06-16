str = File.read("input.txt").chomp

def prot_counts(codon_table)
  proteins = codon_table.scan(/\s(Stop|[A-Z]{1})\s/).flatten

  proteins.uniq.reduce({}) do |memo, prot|
    memo[prot] = proteins.count(prot)
    memo
  end
end

def inferRNA(str, table)
  prod = 3 #number of stop codons

  str.chars.each do |char|
    prot_counts(table).find { |prot, v|  prod *= v if prot == char }
  end

  puts prod % 1000000
end

codon_table = <<-HEREDOC
UUU F      CUU L      AUU I      GUU V
UUC F      CUC L      AUC I      GUC V
UUA L      CUA L      AUA I      GUA V
UUG L      CUG L      AUG M      GUG V
UCU S      CCU P      ACU T      GCU A
UCC S      CCC P      ACC T      GCC A
UCA S      CCA P      ACA T      GCA A
UCG S      CCG P      ACG T      GCG A
UAU Y      CAU H      AAU N      GAU D
UAC Y      CAC H      AAC N      GAC D
UAA Stop   CAA Q      AAA K      GAA E
UAG Stop   CAG Q      AAG K      GAG E
UGU C      CGU R      AGU S      GGU G
UGC C      CGC R      AGC S      GGC G
UGA Stop   CGA R      AGA R      GGA G
UGG W      CGG R      AGG R      GGG G
HEREDOC

inferRNA(str, codon_table)
