require 'nokogiri'
require 'json'

files = Dir['*.xhtml']

files.each do |filename|
  file = File.read(filename)
  p_file = Nokogiri.parse(file).to_str
  p_file = p_file.gsub('á', 'á')
  p_file = p_file.gsub('é', 'é')
  p_file = p_file.gsub('í', 'í')
  p_file = p_file.gsub('ó', 'ó')
  p_file = p_file.gsub('ú', 'ú')

  p_file = p_file.gsub('Á', 'Á')
  p_file = p_file.gsub('É', 'É')
  p_file = p_file.gsub('Í', 'Í')
  p_file = p_file.gsub('Ó', 'Ó')
  p_file = p_file.gsub('Ú', 'Ú')


  p_file = p_file.gsub('ã', 'ã')
  p_file = p_file.gsub('ẽ', 'ẽ')
  p_file = p_file.gsub('ĩ', 'ĩ')
  p_file = p_file.gsub('õ', 'õ')
  p_file = p_file.gsub('ũ', 'ũ')

  p_file = p_file.gsub('Ã', 'ã')
  p_file = p_file.gsub('Ẽ', 'ẽ')
  p_file = p_file.gsub('Ĩ', 'ĩ')
  p_file = p_file.gsub('Õ', 'õ')
  p_file = p_file.gsub('Ũ', 'ũ')

  p_file = p_file.gsub('â', 'â')
  p_file = p_file.gsub('ê', 'ê')
  p_file = p_file.gsub('î', 'î')
  p_file = p_file.gsub('ô', 'ô')
  p_file = p_file.gsub('û', 'û')

  p_file = p_file.gsub('Â', 'Â')
  p_file = p_file.gsub('Ê', 'Ê')
  p_file = p_file.gsub('Î', 'Î')
  p_file = p_file.gsub('Ô', 'Ô')
  p_file = p_file.gsub('Û', 'Û')

  p_file = p_file.gsub('à', 'à')
  p_file = p_file.gsub('À', 'À')

  p_file = p_file.gsub('ç', 'ç')

  p_file = p_file.gsub("’U", "’u")

  p_file = p_file.gsub(/(\-\sme|\-\ste|\-\slo|\-\sla|\-\slhe|\-\slhes|\-\snos|\-\svos|\-\slos|\-\slas)[^\w]/) {|s| '-'+s[2..-1]}
  p_file = p_file.gsub('- ', '')

  p_file = p_file.gsub(/([A-Z])([A-Z])/){|s| $1 + $2.downcase}
  p_file = p_file.gsub(/([A-Z])([A-Z])/){|s| $1 + $2.downcase}
  p_file = p_file.gsub(/([A-Z])([A-Z])/){|s| $1 + $2.downcase}
  p_file = p_file.gsub(/([A-Z])([A-Z])/){|s| $1 + $2.downcase}

  p_file = p_file.gsub(/([[:word:]])([A-Z])/){|s| $1 + $2.downcase}
  p_file = p_file.gsub(/([[:word:]])([A-Z])/){|s| $1 + $2.downcase}
  p_file = p_file.gsub(/([[:word:]])([A-Z])/){|s| $1 + $2.downcase}
  p_file = p_file.gsub(/([[:word:]])([A-Z])/){|s| $1 + $2.downcase}

  p_file = p_file.gsub(/\s(\d+)\s/, ' ')

  p_file = p_file.gsub('  ', ' ')
  p_file = p_file.gsub('  ', ' ')
  p_file = p_file.gsub('  ', ' ')
  p_file = p_file.gsub('  ', ' ')
  p_file = p_file.gsub('  ', ' ')
  p_file = p_file.gsub('  ', ' ')

  p_file = p_file.gsub("\n ", "\n")

  p_file = p_file.gsub("\n\n", "\n")
  p_file = p_file.gsub("\n\n", "\n")
  p_file = p_file.gsub("\n\n", "\n")
  p_file = p_file.gsub("\n\n", "\n")
  p_file = p_file.gsub("\n\n", "\n")
  p_file = p_file.gsub("\n\n", "\n")
  p_file = p_file.gsub("\n\n", "\n")
  p_file = p_file.gsub("\n\n", "\n")
  p_file = p_file.gsub("\n\n", "\n")

  p_file = p_file.gsub(/(\A)\n/){ $1 }
  p_file = p_file.gsub(/\n(\Z)/){ $1 }

  p_file = p_file.gsub(/(\A)([a-z])/){ $1 + $2 }

  filename2 = 'bodies/'+filename[0..-7].gsub(/\A[xz]\-/, '')
  # File.write(filename2+'.txt', p_file)

  j_file = JSON({
    body: p_file.split("\n")[0..-2].join("\n"),
    author: p_file.split("\n")[-1],
    category: filename[0..-6].gsub(/\d/,'').gsub(/\A(\w)/){|s| $1.upcase}
  })

  File.write(filename2+'.json', j_file)
end
