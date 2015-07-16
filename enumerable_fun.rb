class MyEnumerable

  def count_of(items)
    items.flatten.reduce({}) do |hash, item|
      hash[item] ? hash[item] += 1 : hash[item] = 1
      hash
    end
  end

  def most_occuring(items)
    hash = count_of(items)
    hash.select { |key, value| value == max_value(hash) }.keys
  end

  def least_occuring(items)
    hash = count_of(items)
    hash.select { |key, value| value == min_value(hash) }.keys
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

  def sort_asc(items)
    # impliment bubble sort or similar
  end

  def sort_desc(items)
    # impliment reverse bubble sort or similar
  end

  def uniques(items)
    count_of(items).reduce([]) { |uniqs, (key, value)| 
      uniqs << key if value == 1; uniqs
    }.sort
  end

  def sum_columns(items);end

  private

  def max_value(items)
    items.values.max
  end

  def min_value(items)
    items.values.min
  end

  # may be useful helper for sum_colums
  def rotate_2d_ary(items);end

end