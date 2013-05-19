require 'fileutils'

class FileBasics

	def make_a_file
		open('tacos.txt', 'w') do |file|
			file.puts('delicious')
			file.puts('crunchy')
			file.puts('beefy')
			file.puts('salsalicious')
			file.puts('awesomeness')
		end
	end

	def make_a_directory
		FileUtils.mkdir('some_directory')
	end

	def make_for_test
		make_a_file
		make_a_directory

		return File.open('tacos.txt').atime
	end

	def delete_after_test
		# Removal of some_directory
		FileUtils.rmdir('some_directory')

		# Removal of test_filename
		FileUtils.rm('tacos.txt')
	end

	def populate_directory
		open('file_a', 'w') do |f|
			f.puts('contents')
		end

		open('file_b', 'w') do |f|
			f.puts('contents')
		end

		open('file_c', 'w') do |f|
			f.puts('contents')
		end
	end

	def read_directory
		files_in_dir = []

		Dir.foreach('.') { |f| files_in_dir << f if f != '.' && f != '..' }

		return files_in_dir
	end

	def empty_directory
		Dir.foreach('.') { |f| File.delete(f) if f != '.' && f != '..' }
	end

end
