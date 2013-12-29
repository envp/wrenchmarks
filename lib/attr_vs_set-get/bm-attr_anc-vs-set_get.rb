require 'benchmark'

$stdout = File.open("#{__FILE__.gsub(/rb/,'txt')}", 'w')
$stdout.sync = true

# Using attr methods
class Alpha
  attr_accessor :theta
end

# Using manual getter-setter methods
class Beta

  def theta=(value)
    @theta = value
  end

  def theta
    @theta
  end
end

def run_bm(pad = 20)
  iterations = 1_000_000
  # Start benchmark over random instances
  title = "#{__FILE__}: x#{iterations}"
  puts title
  puts "=" * title.length
  Benchmark.bmbm(pad) do |bm|
    bm.report("attr methods:") do
      iterations.times do
       Alpha.new.theta = rand
      end
    end

    bm.report("getter-setter") do
      iterations.times do
       Beta.new.theta = rand
      end
    end
  end
end

run_bm(16)
