=begin
practice for the first week of Algorithms part 1
Quick union & quick find
=end 
=begin
class QF
implements usage of quick find algorithm
@id - array of connections
def connected p,q - returns bool are given elements connected via a tree model connects p,q  - first element with the second one. via changing referense of first element
def get_id - returns @id
def root i finds root element of i
=end
class QF
  def initialize
    @id = []
    10.times do |i|
      @id.push(i)
    end
    #puts @id.inspect
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

=begin
class QU
implements usage of quick union algorithm
def connected p,q - returns bool are given elements connected via a tree model connects p,q  - first element with the second one. via changing referense of first element
def get_id - returns @id
def root i - finds root element of i
def union -  adds a reference to the second tree to a first element root element
=end
class QU < QF
  def connected(p,q)
    return root(p) == root(q)
  end
  
  def union p,q
    i = root(p)
    j = root(q)
    @id[i] = j
  end
  private
  def root i
    while( i != @id[i])
      i = @id[i]
    end
    i
  end
end

=begin
class WeightedQU
implements usage of weighted quick union algorithm
@sz - array of int sizes of a thee. key of a tree - root element key in the array @id
def connected p,q - returns bool are given elements connected via a tree model connects p,q  - first element with the second one. via changing referense of first element
def get_id - returns @id
def root i - finds root element of i
def union -  adds a reference to the largest tree root element (chosen from p & q) to the smallest tree element root element
=end
class WeightedQU < QU
  #alias :parent_initialize :initialize
  def initialize
#    super_a()
    super()
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
=begin
class WeightedQUCompressed
implements usage of weighted quick union  algorithm with a compressed route
def root i - finds root element of i
=end
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
qf = WeightedQUCompressed.new()

# connect elements

qf.union 2,1
qf.union 5,2
qf.union 7,5
qf.union 4,5
qf.union 3,4
qf.union 8,6
qf.union 9,8
# are two elements connected?
puts qf.connected 2,1
t_end = Time.now
# output of the resulting arrays 1 - with id's, 2 - sizes of resulting sizes array
puts "#{qf.get_id} **** #{qf.get_size}"
# output execution time of the script
puts t_end - t_start
