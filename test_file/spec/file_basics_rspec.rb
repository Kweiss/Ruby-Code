# Practice basics of file-manipulation with Ruby; file creation, file access, and file deletion
require 'file_basics'

describe FileBasics do
	# Make the file/directory for tests
	before { @file_creation_time = FileBasics.new.make_for_test }

	describe "file locating and recognition" do
		it "makes a file 'tacos.txt'" do
			(File.file? 'tacos.txt').should == true
		end

		it "makes a directory 'some_directory'" do
			(File.directory? 'some_directory').should == true
		end

		it "does not recognize 'some_directory' as a file" do
			(File.file? 'some_directory').should == false
		end

		it "does not recognize 'tacos.txt' as a directory" do
			(File.directory? 'tacos.txt').should == false
		end

		it "validates the presence of any file or directory through '.exists?'" do
			(File.exists? 'some_directory').should == true
			(File.exists? 'tacos.txt').should == true
		end

		# When File.exists? returns true, the 'file' is present on the system, but does not specify what type of file it is.
		# This is where File.file? and File.directory? may be more useful than File.exists?
	end

	describe "file access" do
		it "recognizes 'tacos.txt' as readable" do
			File.readable?('tacos.txt').should == true
		end

		it "recognizes 'tacos.txt' as writable" do
			File.writable?('tacos.txt').should == true
		end

		it "recognizes 'tacos.txt' as non-executable" do
			File.executable?('tacos.txt').should == false
		end

		it "determines when a file was last accessed" do
			@file_creation_time.should == File.open('tacos.txt').atime
		end
	end

	describe "listing files in a directory" do
		before { FileUtils.cd('some_directory') }
		let(:files_in_dir) { FileBasics.new.read_directory }

		it "should not find any files in the directory" do
			files_in_dir.should == []
		end

		describe "populating a directory" do
			before { FileBasics.new.populate_directory }
			let(:files_in_dir) { FileBasics.new.read_directory }

			it "should list all files in the directory" do
				files_in_dir.include?('file_a').should == true
				files_in_dir.include?('file_b').should == true
				files_in_dir.include?('file_c').should == true
			end
		end

		after do
			FileBasics.new.empty_directory

			FileUtils.cd('..')
		end
	end

	# Remove the file/directory after tests
	after do
		FileBasics.new.delete_after_test
	end

end
