namespace :import_prayers do
  desc 'Imports all XHTML prayers into the DB'
  task 'xhtml-to-json', [:files] => :environment do |t, args|
    # rake import_prayers:xhtml-to-json[/home/tomas/Desktop/parse-xhtml-json/*.xhtml]
    files = Dir[args.files]
    count = 0
    save_count = 0

    puts "Importing #{files.count} prayers"
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

      # p_file = p_file.gsub(/(\A)([a-z])/){ $1 + $2 }
      p_file = p_file[0].mb_chars.capitalize + p_file[1..-1]

      p_file = p_file.gsub(' deus,',' Deus,')
      p_file = p_file.gsub(' deus!',' Deus!')
      p_file = p_file.gsub(' deus?',' Deus?')
      p_file = p_file.gsub(' deus.',' Deus.')
      p_file = p_file.gsub(' teu ', ' Teu ')
      p_file = p_file.gsub(' tua ', ' Tua ')
      p_file = p_file.gsub(' teus ', ' Teus ')
      p_file = p_file.gsub(' tuas ', ' Tuas ')
      p_file = p_file.gsub(' ti ', ' Ti ')
      p_file = p_file.gsub(' tu ', ' Tu ')
      p_file = p_file.gsub(' senhor', ' Senhor')

      # p_file = p_file.gsub()

      category_name = filename.split('/')[-1].split('.')[0].gsub(/\d/,'').gsub(/[zxZX]\-/,'').gsub(/\A(\w)/){|s| $1.mb_chars.capitalize}
      body = p_file.split("\n")[0..-2].join("\n")
      author = p_file.split("\n")[-1].mb_chars.capitalize.gsub('‘a','‘A').gsub('bab','Báb').gsub('báb','Báb')

      if category_name[-4..-1] != 'home' && !category_name.match('Nota')
        begin
          category = Category.find_by(title: category_name) || Category.create(title: category_name)
          prayer = Prayer.new(author: author, body: body, category: category)

          if prayer.save
            puts category_name
            save_count += 1
          else
            puts "Error importing prayer: #{filename}"
          end
        rescue => e
          puts "Error: #{e}"
          puts "Prayer: #{filename}"
        end
        count += 1
      end
    end
    puts "Imported #{count} prayers"
  end
end