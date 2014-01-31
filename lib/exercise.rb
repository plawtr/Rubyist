
class Array

	def map 
		return self if !(block_given?)
		a = []
		self.each{|element| a << yield(element) }
		a
	end

	def mapz &block
		return if self.nil?
		a = self
		b = []
		b << block.call(a.pop)
		b << a.mapz(&block)
		return b
  end

	def select
		return self if !(block_given?)
		a = []
		self.each{|element| a << element if yield(element) }
		a
	end

	def each(&block)
		for i in 0..self.size-1
			a = []
			a << block.call(self[i])
		end
		a
	end
end




