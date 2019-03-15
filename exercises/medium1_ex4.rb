BIRDS = %w(raven finch hawk eagle)

def birds(arr)
  yield(arr)
end

# birds(BIRDS) { |bird1, bird2, *raptors| p raptors }
birds(BIRDS) { |_, _, *raptors| p raptors }
