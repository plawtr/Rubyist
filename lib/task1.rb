
class Array

	def injekt *memo, &block
		memo = memo.empty? ? self.shift : memo.first
		self.each{|element| memo = block.call(memo, element)}
		memo
	end

	def rinjekt *memo, &block 
		a = self.dup
		return a.shift if a.size == 1
		a.unshift(memo.first) unless memo.empty?
		memo = a.shift
		memo = block.call(memo, a.rinjekt(&block)) unless a.empty?
	end
end