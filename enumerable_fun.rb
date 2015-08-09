class MyEnumerable

  def count_of items
    items.flatten.reduce(Hash.new(0)) { |hash, item| hash[item] += 1; hash }
  end

  def most_occuring items
    hash = count_of(items)
    hash.select { |key, value| value == max_value(hash) }.keys
  end

  def least_occuring items
    hash = count_of(items)
    hash.select { |key, value| value == min_value(hash) }.keys
  end

  def sum_of items
    items.flatten.reduce(:+)
  end

  def size_of items
    items.flatten.size
  end

  def sum_prime? items
    n = sum_of(items)
    (2..Math.sqrt(n)).all? { |number| n % number != 0 }
  end

  def average_of items
    sum_of(items).to_f / size_of(items)
  end

  # For the following two:
  # These are bubble sort solution.
  # k is a optimization counter, so with each repeated iteration, 1 less index from the right is checked via the conditional in the block.

  # eventually, I would like to make the two the same method, so it is called like:
  # sort(array, :asc) or sort(array, :desc) and have the one comparison token change direction based on what symbol is being passed. That seems very meta and I just have no idea how to implement that.

  def sort_asc items
    items.flatten!
    k = items.size - 1
    while k > 0
      items.map.with_index do |item, index|
        if index < k && item > items[index+1]
          items[index], items[index+1] = items[index+1], items[index]
        end
      end
      k -= 1
    end
    items
  end

  def sort_desc items
    items.flatten!
    k = items.size - 1
    while k > 0
      items.map.with_index do |item, index|
        if index < k && item < items[index+1]
          items[index], items[index+1] = items[index+1], items[index]
        end
      end
      k -= 1
    end
    items
  end

  def uniques items
    sort_asc(
      count_of(items).reduce([]) { |uniqs, (key, value)| 
        uniqs << key if value == 1; uniqs
      })
  end

  def sum_columns items
    transpose_2d_ary(items).map { |array| array.reduce(:+) }
  end

  private

  def max_value items
    items.values.max
  end

  def min_value items
    items.values.min
  end

  # this only works if each collection within the outer collection is of the same size. I did not take edge cases like irregular collection sizes into account.
  # this doesn't cleanly rotate the collection, but rather takes items with the same index and puts them in their own subcollection within memo.

  def transpose_2d_ary items
    items.reduce(Array.new(items[0].size) { [] }) do |memo, item|
      item.each_with_index do |subitem, index| 
        memo[index].push subitem 
      end
      memo
    end
  end

end