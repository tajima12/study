class Hanoi
  def initialize(n, h)
    @height = n
    @from   = h[:from] || "From"
    @to     = h[:to]   || "To"
    @work   = h[:work] || "Work"
  end

  attr_reader :height, :from, :to, :work

  def each(&block)
    do_hanoi @height, @from, @to, @work, &block
  end

  private

  def do_hanoi(n, from, to, work, &block)
    if n == 1
      yield n, from, to
    else
      do_hanoi n - 1, from, work, to, &block
      yield n, from, to
      do_hanoi n - 1, work, to, from, &block
    end
  end
end


num = (ARGV[0] || 3).to_i #塔の段数
num >= 0 or raise "#{num}: Invalid Number"
hanoi = Hanoi.new(num, :from => "A", :to => "B", :work => "C")
hanoi.each do |n, from, to|
  puts "#{n}: #{from} -> #{to}"
end
