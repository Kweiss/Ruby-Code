require_relative '../test_statistics/lib/calculate_average'
require_relative '../test_statistics/lib/calculate_standard_deviation'
require 'benchmark'

# Combining a couple of previous tests/experiments together:

# some_bm = Benchmark.measure { 5000.times do 'a'*1_000_000 end }

# puts some_bm
	# 	# 3.400000   1.290000   4.690000 (  4.719947)
# puts "#{some_bm.to_a}"
# 	# ["", 3.4, 1.29, 0.0, 0.0, 4.71994686126709]

# # Given the above:
# 	# user CPU time   = some_bm.to_a[1]
# 	# system CPU time = some_bm.to_a[2]
# 	# no idea what some_bm.to_a[3] and some_bm.to_a[4] are related to -
# 		# user + system CPU time = some_bm.to_a[1] + some_bm.to_a[2]
# 	# elapsed real time = some_bm.to_a[5]

# start_time = Time.now

class TheseBenchmarks
	def initialize(*loops)
		@n1 = loops[1]
		@n2 = loops[0]
	end

	def pluralize(n)
		if n == 1
			"test"
		else
			"tests"
		end
	end

	# Benchmark tests without labels:
	def benchmark_without_labels
		benchmark_times_without_labels = { :user_for => [], :user_times => [], :user_upto => [],
																			 :syst_for => [], :syst_times => [], :syst_upto => [],
																			 :totl_for => [], :totl_times => [], :totl_upto => [],
																			 :real_for => [], :real_times => [], :real_upto => [] }

		test_without_labels = Benchmark.measure do
			@n2.times do
				test_for = Benchmark.bm do |x|
					x.report { for i in 1..@n1; a = '1'; end }
				end

				test_times = Benchmark.bm do |x|
					x.report { @n1.times do   ; a = '1'; end }
				end

				test_upto = Benchmark.bm do |x|
					x.report { 1.upto(@n1) do ; a = '1'; end }
				end

				test_for   = test_for[0].to_a
				test_times = test_times[0].to_a
				test_upto  = test_upto[0].to_a

				benchmark_times_without_labels[:user_for] << test_for[1]
				benchmark_times_without_labels[:syst_for] << test_for[2]
				benchmark_times_without_labels[:totl_for] << test_for[1] + test_for[2]
				benchmark_times_without_labels[:real_for] << test_for[5]

				benchmark_times_without_labels[:user_times] << test_times[1]
				benchmark_times_without_labels[:syst_times] << test_times[2]
				benchmark_times_without_labels[:totl_times] << test_times[1] + test_times[2]
				benchmark_times_without_labels[:real_times] << test_times[5]

				benchmark_times_without_labels[:user_upto] << test_upto[1]
				benchmark_times_without_labels[:syst_upto] << test_upto[2]
				benchmark_times_without_labels[:totl_upto] << test_upto[1] + test_upto[2]
				benchmark_times_without_labels[:real_upto] << test_upto[5]

			end
		end

		benchmark_times_without_labels.each do |k, v|
			v.sort!
		end

		return [test_without_labels.to_a, benchmark_times_without_labels]
	end # end benchmark_without_labels

	# Benchmark tests with labels:
	def benchmark_with_labels
		benchmark_times_with_labels = { :user_for => [], :user_times => [], :user_upto => [],
																		:syst_for => [], :syst_times => [], :syst_upto => [],
																		:totl_for => [], :totl_times => [], :totl_upto => [],
																		:real_for => [], :real_times => [], :real_upto => [] }

		test_with_labels = Benchmark.measure do
			@n2.times do
				test_for = Benchmark.bm do |x|
					x.report("for:  ") { for i in 1..@n1; a = '1'; end }
				end

				test_times = Benchmark.bm do |x|
					x.report("times:") { @n1.times do   ; a = '1'; end }
				end

				test_upto = Benchmark.bm do |x|
					x.report("upto: ") { 1.upto(@n1) do ; a = '1'; end }
				end

				test_for   = test_for[0].to_a
				test_times = test_times[0].to_a
				test_upto  = test_upto[0].to_a

				benchmark_times_with_labels[:user_for] << test_for[1]
				benchmark_times_with_labels[:syst_for] << test_for[2]
				benchmark_times_with_labels[:totl_for] << test_for[1] + test_for[2]
				benchmark_times_with_labels[:real_for] << test_for[5]

				benchmark_times_with_labels[:user_times] << test_times[1]
				benchmark_times_with_labels[:syst_times] << test_times[2]
				benchmark_times_with_labels[:totl_times] << test_times[1] + test_times[2]
				benchmark_times_with_labels[:real_times] << test_times[5]

				benchmark_times_with_labels[:user_upto] << test_upto[1]
				benchmark_times_with_labels[:syst_upto] << test_upto[2]
				benchmark_times_with_labels[:totl_upto] << test_upto[1] + test_upto[2]
				benchmark_times_with_labels[:real_upto] << test_upto[5]

			end
		end

		benchmark_times_with_labels.each do |k, v|
			v.sort!
		end

		return [test_with_labels.to_a, benchmark_times_with_labels]
	end # end benchmark_with_labels

	def compute_times(no_lab, w_lab, *times)
		puts
		if times != []
			puts "Computation time for #{times[0]} #{pluralize(times[0])} (#{times[1]} evaluations/test):"
			puts "Without labels: | User: #{(sprintf '%.4f', no_lab[0][1]).to_f} | System: #{(sprintf '%.4f', no_lab[0][2]).to_f} | Total: #{(sprintf '%.4f', (no_lab[0][1] + no_lab[0][2])).to_f} | Real: #{(sprintf '%.4f', no_lab[0][5]).to_f}"
			puts "With labels:    | User: #{(sprintf '%.4f', w_lab[0][1]).to_f} | System: #{(sprintf '%.4f', w_lab[0][2]).to_f} | Total: #{(sprintf '%.4f', (w_lab[0][1] + w_lab[0][2])).to_f} | Real: #{(sprintf '%.4f', w_lab[0][5]).to_f}"
			puts
		end
		
		puts "Lowest test times:"
		puts "  .for tests - without labels:"
		puts "    User: #{(sprintf '%.4f', no_lab[1][:user_for][0]).to_f} | System: #{(sprintf '%.4f', no_lab[1][:syst_for][0]).to_f} | Total: #{(sprintf '%.4f', no_lab[1][:totl_for][0]).to_f} | Real: #{(sprintf '%.4f', no_lab[1][:real_for][0]).to_f}"
		puts "  .for tests - with labels:"
		puts "    User: #{(sprintf '%.4f', w_lab[1][:user_for][0]).to_f} | System: #{(sprintf '%.4f', w_lab[1][:syst_for][0]).to_f} | Total: #{(sprintf '%.4f', w_lab[1][:totl_for][0]).to_f} | Real: #{(sprintf '%.4f', w_lab[1][:real_for][0]).to_f}"
		puts
		puts "  .times tests - without labels:"
		puts "    User: #{(sprintf '%.4f', no_lab[1][:user_times][0]).to_f} | System: #{(sprintf '%.4f', no_lab[1][:syst_times][0]).to_f} | Total: #{(sprintf '%.4f', no_lab[1][:totl_times][0]).to_f} | Real: #{(sprintf '%.4f', no_lab[1][:real_times][0]).to_f}"
		puts "  .times tests - with labels:"
		puts "    User: #{(sprintf '%.4f', w_lab[1][:user_times][0]).to_f} | System: #{(sprintf '%.4f', w_lab[1][:syst_times][0]).to_f} | Total: #{(sprintf '%.4f', w_lab[1][:totl_times][0]).to_f} | Real: #{(sprintf '%.4f', w_lab[1][:real_times][0]).to_f}"
		puts
		puts "  .upto tests - without labels:"
		puts "    User: #{(sprintf '%.4f', no_lab[1][:user_upto][0]).to_f} | System: #{(sprintf '%.4f', no_lab[1][:syst_upto][0]).to_f} | Total: #{(sprintf '%.4f', no_lab[1][:totl_upto][0]).to_f} | Real: #{(sprintf '%.4f', no_lab[1][:real_upto][0]).to_f}"
		puts "  .upto tests - with labels:"
		puts "    User: #{(sprintf '%.4f', w_lab[1][:user_upto][0]).to_f} | System: #{(sprintf '%.4f', w_lab[1][:syst_upto][0]).to_f} | Total: #{(sprintf '%.4f', w_lab[1][:totl_upto][0]).to_f} | Real: #{(sprintf '%.4f', w_lab[1][:real_upto][0]).to_f}"
		puts

		puts "Highest test times:"
		puts "  .for tests - without labels:"
		puts "    User: #{(sprintf '%.4f', no_lab[1][:user_for][-1]).to_f} | System: #{(sprintf '%.4f', no_lab[1][:syst_for][-1]).to_f} | Total: #{(sprintf '%.4f', no_lab[1][:totl_for][-1]).to_f} | Real: #{(sprintf '%.4f', no_lab[1][:real_for][-1]).to_f}"
		puts "  .for tests - with labels:"
		puts "    User: #{(sprintf '%.4f', w_lab[1][:user_for][-1]).to_f} | System: #{(sprintf '%.4f', w_lab[1][:syst_for][-1]).to_f} | Total: #{(sprintf '%.4f', w_lab[1][:totl_for][-1]).to_f} | Real: #{(sprintf '%.4f', w_lab[1][:real_for][-1]).to_f}"
		puts
		puts "  .times tests - without labels:"
		puts "    User: #{(sprintf '%.4f', no_lab[1][:user_times][-1]).to_f} | System: #{(sprintf '%.4f', no_lab[1][:syst_times][-1]).to_f} | Total: #{(sprintf '%.4f', no_lab[1][:totl_times][-1]).to_f} | Real: #{(sprintf '%.4f', no_lab[1][:real_times][-1]).to_f}"
		puts "  .times tests - with labels:"
		puts "    User: #{(sprintf '%.4f', w_lab[1][:user_times][-1]).to_f} | System: #{(sprintf '%.4f', w_lab[1][:syst_times][-1]).to_f} | Total: #{(sprintf '%.4f', w_lab[1][:totl_times][-1]).to_f} | Real: #{(sprintf '%.4f', w_lab[1][:real_times][-1]).to_f}"
		puts
		puts "  .upto tests - without labels:"
		puts "    User: #{(sprintf '%.4f', no_lab[1][:user_upto][-1]).to_f} | System: #{(sprintf '%.4f', no_lab[1][:syst_upto][-1]).to_f} | Total: #{(sprintf '%.4f', no_lab[1][:totl_upto][-1]).to_f} | Real: #{(sprintf '%.4f', no_lab[1][:real_upto][-1]).to_f}"
		puts "  .upto tests - with labels:"
		puts "    User: #{(sprintf '%.4f', w_lab[1][:user_upto][-1]).to_f} | System: #{(sprintf '%.4f', w_lab[1][:syst_upto][-1]).to_f} | Total: #{(sprintf '%.4f', w_lab[1][:totl_upto][-1]).to_f} | Real: #{(sprintf '%.4f', w_lab[1][:real_upto][-1]).to_f}"
		puts

		ul_for_tests = [] << no_lab[1][:user_for] << no_lab[1][:syst_for] << no_lab[1][:totl_for] << no_lab[1][:real_for]
		ul_for_tests.collect! { |i|  i = StandardDeviation.new.calc_std_dev(i, 4) }

		ul_times_tests = [] << no_lab[1][:user_times] << no_lab[1][:syst_times] << no_lab[1][:totl_times] << no_lab[1][:real_times]
		ul_times_tests.collect! { |i|  i = StandardDeviation.new.calc_std_dev(i, 4) }

		ul_upto_tests = [] << no_lab[1][:user_upto] << no_lab[1][:syst_upto] << no_lab[1][:totl_upto] << no_lab[1][:real_upto]
		ul_upto_tests.collect! { |i|  i = StandardDeviation.new.calc_std_dev(i, 4) }

		l_for_tests = [] << w_lab[1][:user_for] << w_lab[1][:syst_for] << w_lab[1][:totl_for] << w_lab[1][:real_for]
		l_for_tests.collect! { |i|  i = StandardDeviation.new.calc_std_dev(i, 4) }

		l_times_tests = [] << w_lab[1][:user_times] << w_lab[1][:syst_times] << w_lab[1][:totl_times] << w_lab[1][:real_times]
		l_times_tests.collect! { |i|  i = StandardDeviation.new.calc_std_dev(i, 4) }

		l_upto_tests = [] << w_lab[1][:user_upto] << w_lab[1][:syst_upto] << w_lab[1][:totl_upto] << w_lab[1][:real_upto]
		l_upto_tests.collect! { |i|  i = StandardDeviation.new.calc_std_dev(i, 4) }

		# unlabeled
		puts "Standard deviation of test times:"
		puts "  .for tests - without labels:"
		puts "    User: #{ul_for_tests[0]} | System: #{ul_for_tests[1]} | Total: #{ul_for_tests[2]} | Real: #{ul_for_tests[3]}"
		puts "  .for tests - with labels:"
		puts "    User: #{l_for_tests[0]} | System: #{l_for_tests[1]} | Total: #{l_for_tests[2]} | Real: #{l_for_tests[3]}"
		puts
		puts "  .times tests - without labels:"
		puts "    User: #{ul_times_tests[0]} | System: #{ul_times_tests[1]} | Total: #{ul_times_tests[2]} | Real: #{ul_times_tests[3]}"
		puts "  .times tests - with labels:"
		puts "    User: #{l_times_tests[0]} | System: #{l_times_tests[1]} | Total: #{l_times_tests[2]} | Real: #{l_times_tests[3]}"
		puts
		puts "  .upto tests - without labels:"
		puts "    User: #{ul_upto_tests[0]} | System: #{ul_upto_tests[1]} | Total: #{ul_upto_tests[2]} | Real: #{ul_upto_tests[3]}"
		puts "  .upto tests - with labels:"
		puts "    User: #{l_upto_tests[0]} | System: #{l_upto_tests[1]} | Total: #{l_upto_tests[2]} | Real: #{l_upto_tests[3]}"
	end # end compute_times

end # end TheseBenchmarks class

# n1 = 300_000
# n2 = 10

# bm_wo_l = TheseBenchmarks.new(n2, n1).benchmark_without_labels
# bm_w_l = TheseBenchmarks.new(n2, n1).benchmark_with_labels

# TheseBenchmarks.new.compute_times(bm_wo_l, bm_w_l, n2, n1)

# end_time = Time.now

# puts
# puts "Elapsed time: #{end_time - start_time}"
