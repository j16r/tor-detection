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
File.open(ARGV[0]) do |file|
  file.each do |line|
    matches = line.match(/month\s*=\s*\{([A-Za-z]+)\}/)
    if matches #and MONTHS.include?(matches[1])
      index = MONTHS.index(matches[1]) + 1
      puts "#{line[0..(matches.offset(1)[0] - 1)]}#{index}#{line[(matches.offset(1)[1])..-1]}"
    else
      puts line
    end
  end
end
