module Services
  class PerformanceTest
    RESULTS_FILEPATH = "#{Dir.pwd}/results.txt"

    def self.call(measurments_numbers: [], n: 10, ranges: [[390, 1300]])
      new(measurments_numbers, n, ranges).call
    end

    def initialize(measurments_numbers, n, ranges)
      @measurments_numbers = measurments_numbers
      @n = n
      @ranges = ranges
      @results_file = File.open(RESULTS_FILEPATH, "w").close
      write_to_file("n: #{@n}")
    end

    def call
      @measurments_numbers.each do |measurments_number|
        CreateFakeMeasurments.call(measurments_number)
        @ranges.each do |range|
          times = []
          memory_usage_sum = 0

          @n.times do |i|
            results = find_similar(range)
            times.push(results[:time])
            memory_usage_sum += results[:mem_usage]
          end

          average_time = times.sum / times.size.to_f
          average_mem_usage = memory_usage_sum / @n

          write_to_file(
            "range: #{range}, "                    \
            "measurments: #{measurments_number}, " \
            "average time: #{average_time}, "      \
            "memory usage: #{average_mem_usage} "
          )
        end
      end
    end

    private

    def find_similar(range)
      id = measurment_repository.first.id
      t = Time.now
      measurment_repository.find_similar(id: id, range: range)
      t = Time.now - t
      { time: t, mem_usage: check_memory_usage }
    end

    def measurment_repository
      MeasurmentRepository.new
    end

    def check_memory_usage
      mb = GetProcessMem.new.mb
      mb.round
    end

    def write_to_file(text)
      f = File.open(RESULTS_FILEPATH, "a")
      f.puts(text)
      f.close
    end
  end
end
