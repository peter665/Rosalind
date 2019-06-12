require 'nokogiri'
require 'open-uri'

File.open('input.txt') do |f|
  File.open('result.txt','w') do |res|
    url = "http://www.uniprot.org/uniprot"
    f.each_line do |line|
      id = line.chomp
      pattern = /(?=(N[^P](S|T)[^P]))/
      begin
        doc = Nokogiri::HTML.parse(open(url + "/" + id + ".fasta"))
        string = doc.css("p").text.gsub("\n", "").scan(/[A-Z]{10,}/)[0]

        positions = string.enum_for(:scan, pattern).map do
          Regexp.last_match.begin(0) + 1
        end

        unless positions.empty?
          res.puts id
          res.write positions.join(' ')
          res.puts
        end
      rescue
        puts "ID: #{id} doesnt exist. Trying next ID..."
        next
      end
    end
  end
end
