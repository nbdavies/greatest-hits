# recursive solution
def binary_search_include?(match,array)
  return true if match == array[0]
  return false if match != array[0] && array.length == 1
  halfway = array.length/2
  range = (match >= array[halfway]? (halfway..-1) : (0..halfway-1))
  binary_search_include?(match,array[range])
end

# iterative solution
def binary_search_include?(match,array)
  while array.length > 1 do
    halfway = array.length/2
    range = (match >= array[halfway]? (halfway..-1) : (0..halfway-1))
    array = array[range]
  end
  return true if match == array[0]
  return false if match != array[0]
end