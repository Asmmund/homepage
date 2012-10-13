# To change this template, choose Tools | Templates
# and open the template in the editor.

class QF
  def initialize
    @id = []
    10.times do |i|
      @id.push(i)
    end
    #puts @id.inspect
  end
  
  def union(p,q)
    @id
  end

  def connected(p,q)
    @id[p] == @id[q]
  end
  
  def union p,q
    @id[p] = q
  end
  
  def get_id
    @id
  end
  
  
  private
  def root(i)
    while i != @id[i]
      i=@id[i]
    end
    i
  end
end

class QU < QF
  def connected(p,q)
    return root(p) == root(q)
  end
  
  def union p,q
    i = root(p)
    j = root(q)
    @id[i] = j
  end
#  def set_connection
#    
#    @id.each_with_index do |val,index|
#      @id[index] = @id[index+2] if index < @id.size - 3
#    end
#  end
  private
  def root i
    while( i != @id[i])
      i = @id[i]
    end
    i
  end
end


class WeightedQU < QU
  alias :parent_initialize :initialize
  def initialize
    parent_initialize()
    @sz = []
    10.times do |i|
      @sz[i] = 1
    end
  end
  
  def union p, q
    i = root(p)
    j = root(q)
    if @sz[i]<=@sz[j]
      @id[i] = j
      @sz[j] += @sz[i]

      @sz[i] = 0
    else
      @id[j] = i
      @sz[i] += @sz[j]
      @sz[j] = 0
      
    end
  end
  def get_size
    @sz
  end
end

class WeightedQUCompressed < WeightedQU
 private 
 def root i
   while(i != @id[i])
     @id[i] = @id[@id[i]]
     i = @id[i]
   end
   i
 end
end
t_start = Time.now
qf = WeightedQUCompressed.new
#qf.set_connection

qf.union 2,1
qf.union 5,2
qf.union 7,5
qf.union 4,5
qf.union 3,4
qf.union 8,6
qf.union 9,8


#qf.union 3,2
puts qf.connected 2,1
t_end = Time.now

puts "#{qf.get_id} **** #{qf.get_size}"
puts t_end - t_start
