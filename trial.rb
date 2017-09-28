class Array
  def extended_each
    i=0
    while i<self.size
      yield(self[i])
      i += 1
    end
    self
  end
end

[1,2,3,4].extended_each{|num| print "#{num} "}
