require 'benchmark'

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

iterations = 1_000_000

# Start benchmark over random instances
Benchmark.bmbm(20) do |bm|
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
