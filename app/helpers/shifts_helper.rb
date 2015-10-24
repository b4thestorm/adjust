module ShiftsHelper
  
  def index_for_options(list)
  list2 = list.dup
  list2.map!{|x| Array.new(1,x) << x} 
    count = 0
    while count < list2.length
        list2[count][1] = count + 1
        count += 1
    end
    return list2
  end 


  # arr = [[1,1], [2,2], [3,3], [4,4]]
  #arr[0][1]
  #arr[1][1] 
  #arr[2][1]
  #arr[3][1]
end
