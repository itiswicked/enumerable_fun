require_relative 'enumerable_fun'

describe MyEnumerable do

  before(:each) do
    @items       = [ [1, 2, 3, 4, 5],
                     [4, 3, 5, 6, 2],
                     [2, 1, 7, 6, 0] ]
    @other_items = [5, 8, 6, 4, 3, 99, 4, 82, 1]
    @e = MyEnumerable.new
  end

  it 'counts each item in collection' do
    expect( @e.count_of([])).to eq( {} )

    expect( @e.count_of([1,2,1,2])).to eq( { 1 => 2, 2 => 2 } )

    expect( @e.count_of(@items)).to eq(
      { 1 => 2, 2 => 3, 3 => 2, 4 => 2, 
        5 => 2, 6 => 2, 7 => 1, 0 => 1 } )
  end

  it 'returns which item(s) appear most' do
    expect( @e.most_occuring []     ).to eq [] 
    expect( @e.most_occuring @items ).to eq [2]
  end

  it 'returns which item(s) appear least' do
    expect( @e.least_occuring []     ).to eq [] 
    expect( @e.least_occuring @items ).to eq [7,0] 
  end

  it 'returns the sum of all numbers in collection' do
    expect( @e.sum_of []     ).to eq nil
    expect( @e.sum_of @items ).to eq 51
  end

  it 'returns the size of the collection' do
    expect( @e.size_of []     ).to eq 0
    expect( @e.size_of @items ).to eq 15
  end

  it 'determines if sum of collection is prime' do
    expect( @e.sum_prime? [53]   ).to eq true
    expect( @e.sum_prime? @items ).to eq false
  end

  it 'returns average value of items' do
    expect( @e.average_of [3,4,5] ).to eq 4.0
    expect( @e.average_of @items  ).to eq 3.4
  end

  it 'returns collection sorted ascending' do
    expect( @e.sort_asc [] ).to eq []

    expect( @e.sort_asc @other_items )
      .to eq [1, 3, 4, 4, 5, 6, 8, 82, 99]

    expect( @e.sort_asc @items )
      .to eq [0, 1, 1, 2, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7]
  end

  it 'returns collection sorted descending' do    
    expect( @e.sort_desc [] ).to eq []

    expect( @e.sort_desc @other_items )
      .to eq [99, 82, 8, 6, 5, 4, 4, 3, 1]

    expect( @e.sort_desc @items )
      .to eq [7, 6, 6, 5, 5, 4, 4, 3, 3, 2, 2, 2, 1, 1, 0]
  end

  it 'returns unique items in collection sorted descending' do
    repetitous_collection = [1,1,4,4,5,6,7,7,8]

    expect( @e.uniques []           ).to eq []
    expect( @e.uniques [1,2,1,2]    ).to eq []
    expect( @e.uniques @other_items ).to eq [1, 3, 5, 6, 8, 82, 99]
    expect( @e.uniques @items       ).to eq [0, 7]
  end

  it 'rotates a 2d array 90 degrees counter-clockwise' do
    # write example that raises exception if 2d array is not passed
    # write example that raises exception if sub-arrays of equal length are not passed
    two_dee_ary = [ [1, 2, 3], [4, 5, 6], [7, 8, 9,] ]

    expect( @e.send :rotate_2d_ary, two_dee_ary )
      .to eq [ [3, 6, 9], [2, 5, 8], [1, 4, 7] ]

    expect( @e.send :rotate_2d_ary, @items )
      .to eq [ [5, 2, 0], [4, 6, 6], [3, 5, 7], [2, 3, 1], [1, 4, 2] ]
  end

  it 'sums columns of 2d array' do
    # write example that raises exception if 2d array is not passed
    expect( @e.sum_columns @items).to eq [7, 6, 15, 16, 7]
  end

end