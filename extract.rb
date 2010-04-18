references = {}
File.open('TXT.rtf') do |file|
  grab = Proc.new do |no, line, matcher|
    while match = line.match(matcher)
      line.slice!(matcher)
      ref = {:year => match[2], :author => match[1]}
      references[ref] = match[0]
      STDERR.puts "#{no}: #{ref[:year]}, #{ref[:author]}"
    end
  end

  file.each do |line|
    # In the form of Erzats et al., (2004)
    grab.call 1, line, /([A-Z][^\s]+?\s+et\s+al.),?\s*\(([12][0-9]{3}[A-Za-z]*)\)/

    # In the form of Dougan and Howard (2004)
    grab.call 2, line, /([A-Z][^\s()]+?\s+and\s+[A-Z][^\s()]+?)\s*\(([12][0-9]{3}[A-Za-z]*)\)/

    # In the form of (Zekis, 2009)
    grab.call 3, line, /\(([^(,]+?),\s*([12][0-9]{3}[A-Za-z]*)\)/

    # In the form of Danezis (1999)
    grab.call 4, line, /([A-Z][^\s()]+?),?\s*\(([12][0-9]{3}[a-z]*)\)/i
  end
end
puts "# Found #{references.size} references"
puts "# listing alphabetically..."
references.to_a.sort do |a,b|
  a[0][:year] <=> b[0][:year] &&
  a[0][:author] <=> b[0][:author]
end.each do |reference|
  puts "#{reference[0][:year]}, #{reference[0][:author]}"
end
