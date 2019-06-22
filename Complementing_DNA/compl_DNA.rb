def compl_DNA(str)
  h = { "A":"T", "T":"A", "C":"G", "G":"C"}
  str.chars.map {|c| h[c.to_sym]}.reverse.join
end
