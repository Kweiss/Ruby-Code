require 'benchmark' # require for Benchmarking
require 'fileutils' # require for Ruby's File Utilities (mkdir, rmdir, open, rm)

require_relative 'test_benchmarking' # require for TheseBenchmarks class & related methods

@test_files = []

@unlabeled_results = [ [], {:user_for=>[], :user_times=>[], :user_upto=>[],
														:syst_for=>[], :syst_times=>[], :syst_upto=>[],
														:totl_for=>[], :totl_times=>[], :totl_upto=>[],
														:real_for=>[], :real_times=>[], :real_upto=>[]} ]
@labeled_results   = [ [], {:user_for=>[], :user_times=>[], :user_upto=>[],
														:syst_for=>[], :syst_times=>[], :syst_upto=>[],
														:totl_for=>[], :totl_times=>[], :totl_upto=>[],
														:real_for=>[], :real_times=>[], :real_upto=>[]} ]

def manage_directory(cond, *file)
	if cond == 'mkdir'
		FileUtils.mkdir('test_results')
	elsif cond == 'rmdir'
		FileUtils.rmdir('test_results')
	elsif cond == 'cd_in'
		FileUtils.cd('test_results')
	elsif cond == 'cd_out'
		FileUtils.cd('..')
	end
end # end manage_directory

def reformat_array(array)
	reformat = [[]]

	array.each do |i|
		reformat[0] << i if i != array[-1]
	end

	reformat[1] = eval(array[-1])

	return reformat
end # end reformat_array

def write_to_file(gen_name, contents)
	i = 0
	saved = false

	until saved == true
		generated_name = gen_name + "_" + i.to_s + ".txt"

		if File.file?(generated_name)
			i += 1
		else
			break
		end
	end

	open(generated_name, 'w') do |f|
		f.puts(contents)
	end

	@test_files << generated_name
end # end write_to_file

def read_file(file)
	File.open(file, 'r') do |infile|
		current_read = []
		current_line = 1

		while (line = infile.gets)
			if current_line % 2 == 0
				current_read << eval(line)
			else
				current_read << line
			end

			current_line += 1
		end

		current_read = reformat_array(current_read)

		if file.include?('bm_wo_l')
			@unlabeled_results[0] << current_read[0]

			@unlabeled_results[1][:user_for]   << current_read[1][:user_for][0]
			@unlabeled_results[1][:user_times] << current_read[1][:user_times][0]
			@unlabeled_results[1][:user_upto]  << current_read[1][:user_upto][0]
			@unlabeled_results[1][:syst_for]   << current_read[1][:syst_for][0]
			@unlabeled_results[1][:syst_times] << current_read[1][:syst_times][0]
			@unlabeled_results[1][:syst_upto]  << current_read[1][:syst_upto][0]
			@unlabeled_results[1][:totl_for]   << current_read[1][:totl_for][0]
			@unlabeled_results[1][:totl_times] << current_read[1][:totl_times][0]
			@unlabeled_results[1][:totl_upto]  << current_read[1][:totl_upto][0]
			@unlabeled_results[1][:real_for]   << current_read[1][:real_for][0]
			@unlabeled_results[1][:real_times] << current_read[1][:real_times][0]
			@unlabeled_results[1][:real_upto]  << current_read[1][:real_upto][0]
		elsif file.include?('bm_w_l')
			@labeled_results[0] << current_read[0]

			@labeled_results[1][:user_for]   << current_read[1][:user_for][0]
			@labeled_results[1][:user_times] << current_read[1][:user_times][0]
			@labeled_results[1][:user_upto]  << current_read[1][:user_upto][0]
			@labeled_results[1][:syst_for]   << current_read[1][:syst_for][0]
			@labeled_results[1][:syst_times] << current_read[1][:syst_times][0]
			@labeled_results[1][:syst_upto]  << current_read[1][:syst_upto][0]
			@labeled_results[1][:totl_for]   << current_read[1][:totl_for][0]
			@labeled_results[1][:totl_times] << current_read[1][:totl_times][0]
			@labeled_results[1][:totl_upto]  << current_read[1][:totl_upto][0]
			@labeled_results[1][:real_for]   << current_read[1][:real_for][0]
			@labeled_results[1][:real_times] << current_read[1][:real_times][0]
			@labeled_results[1][:real_upto]  << current_read[1][:real_upto][0]
		end
	end
end # end read_file

def average(array)
	user_cpu = []
	syst_cpu = []
	rel_time = []

	array.each do |a|
		a[1] = a[1].to_f
		a[2] = a[2].to_f
		a[5] = a[5].to_f

		user_cpu << a[1]
		syst_cpu << a[2]
		rel_time << a[5]
	end

	return [nil, Average.new(user_cpu).calc_avg, Average.new(syst_cpu).calc_avg, nil, nil, Average.new(rel_time).calc_avg]
end # end average










begin
	if File.directory?('test_results')
		messages = ["", "-**!!! WARNING !!!**-", "",
								"test_results directory already exists.",
								"Please ensure you have a copy of everything you want",
								"from the test_results directory, delete the directory, then run again.", ""]

		messages.each do |m|
			puts m.center(70)
		end

		exit 0
	else
		manage_directory('mkdir')
		manage_directory('cd_in')
	end



	# Test, and write results to files
	n1 = 300_000
	n2 = 2

	n2.times do
		@bm_wo_l = TheseBenchmarks.new(n2, n1).benchmark_without_labels
		@bm_w_l = TheseBenchmarks.new(n2, n1).benchmark_with_labels

		write_to_file('bm_wo_l', @bm_wo_l)
		write_to_file('bm_w_l', @bm_w_l)
	end

	# Reading files
	@test_files.each do |file|
		read_file(file)
	end

	# Average benchmark times across all test files
	@unlabeled_results[0] = average(@unlabeled_results[0])
	@labeled_results[0]   = average(@labeled_results[0])

	# Compute the test times
	TheseBenchmarks.new.compute_times(@bm_wo_l, @bm_w_l, n2, n1)

ensure
	# When finished...
		# ...remove test files...
	@test_files.each do |file|
		FileUtils.rm(file)
	end
		# ...then remove the directory.
	manage_directory('cd_out')
	manage_directory('rmdir')
end
