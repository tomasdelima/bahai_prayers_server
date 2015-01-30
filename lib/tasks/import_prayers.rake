namespace :import_prayers do
  desc 'Imports all JSON prayers in the given folder'
  task :run, [:files]  => :environment  do |t, args|
    filenames = Dir[args.files]
    prayer_count = 0

    filenames.each do |filename|
      if filename[-6].match(/\d/) && !filename.match('nota')
        file = JSON(File.read(filename))
        category_name = file['category'].camelcase.gsub(/(\.|X\-)/,'')
        category = Category.find_by(title: category_name) || Category.create(title: category_name)
        prayer = Prayer.new(author: file['author'], body: file['body'], category: category)

        if prayer.save
          puts filename
          prayer_count += 1
        else
          puts "Error importing prayer: #{filename}"
        end
      end
    end
    puts "Finished importing #{prayer_count} prayers"
  end
end