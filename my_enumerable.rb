module MyEnumerable
  def my_find
    self.my_each do |word|
      return word if yield(word)
    end
    return nil
  end
  
  # Iterate through array
  # Perform code block on each item
  # Store result into a new array
  # return the new array
  def my_map
    array = []
    self.my_each do |word|
      array << yield(word)
    end
    return array
  end

  def my_reject
    array = []
    self.my_each do |word|
      array << word if !yield(word)
    end
    return array
  end

  def my_select
    array = []
    self.my_each do |word|
      array << word if yield(word)
    end
    return array
  end

  # Coding #my_all? is optional.
  #If the block is ever returns false, then the method returns false
  def my_all?
    self.my_each do |word|
      return false if !yield(word)
    end
    return true
  end

  # Coding #my_reduce is optional.
  def my_reduce(starting_value = nil)
    if starting_value != nil
      aggregate = starting_value
      starting_position = 0
    else
      aggregate = self[0]
      starting_position = 1
    end
    self[starting_position..-1].my_each do |word|
      aggregate = yield(aggregate, word)
    end
    aggregate
  end
end