#!/usr/bin/ruby
#
# Papers outputs standard bibtex catalogs, which biblatex has some slight
# trouble with
#
# 1.
#
# Biblatex prefers months in format {1} -> {12}
# Bibtex uses months in abbrev {Jan} -> {Dec}
#
MONTHS = %w[Jan Feb Mar Apr May June July Aug Sept Oct Nov Dec]

def find_month(text)
  MONTHS.each_with_index do |month, index|
    return (index + 1) if month =~ /\A#{month}/i
  end
end

File.open(ARGV[0]) do |file|
  file.each do |line|
    matches = line.match(/month\s*=\s*\{([A-Za-z]+)\}/i)
    if matches && (index = find_month(matches[1]))
      puts "#{line[0..(matches.offset(1)[0] - 1)]}#{index}#{line[(matches.offset(1)[1])..-1]}"
    else
      puts line
    end
  end
end
