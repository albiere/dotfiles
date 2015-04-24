TARGET_DIR = "#{ENV['HOME']}/.dotfiles"
SOURCE_FILES = Rake::FileList['dotfiles/*.sh']
CONFIG_FILES = Rake::FileList['files/*']

task :copy_source_files do
  mkdir_p TARGET_DIR
  cp SOURCE_FILES, TARGET_DIR
end

task :copy_dotfiles do
  CONFIG_FILES.each do |file|
    cp file, file.pathmap("#{ENV['HOME']}/.%f") 
  end 
end 

task :default => [:copy_source_files, :copy_dotfiles]

