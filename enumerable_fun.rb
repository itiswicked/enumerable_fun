class MyEnumerable

  def count_each(items)
    items.flatten.reduce({}) do |hash, item|
      hash[item] ? hash[item] += 1 : hash[item] = 1
      hash
    end
  end

  def most_occuring(items)
    hash = count_each(items)
    items.flatten.reduce([]) do |memo, item|
      if hash[item] == hash[memo.last] && item != memo.last
        memo << item
      elsif memo.empty? || hash[item] > hash[memo.last] 
        memo = [item] 
      end
      memo
    end
  end

  def least_occuring(items)
    hash = count_each(items)
    min_value = hash.values.min
    hash.select { |key, value| value == min_value }.keys
  end

  def sum_of(items)
    items.flatten.reduce(:+)
  end

  def size_of(items)
    items.flatten.size
  end

  def sum_prime?(items)
    n = sum_of(items)
    (2..Math.sqrt(n)).all? { |number| n % number != 0 }
  end

  def average_of(items)
    sum_of(items).to_f / size_of(items)
  end

  def sort_asc(items);end

  def sort_desc(items);end

  def uniques(items)
    count_each(items).reduce([]) { |uniqs, (key, value)| 
      uniqs << key if value == 1; uniqs
    }.sort
  end

  def sum_columns(items);end

  private

  # may be useful helper for sum_colums
  def rotate_2d_ary(items);end

end