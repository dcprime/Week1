# Program logger program take 2

$nesting_depth = 0

def log desc, &block
indent = '  ' * $nesting_depth
  puts indent + 'Beginning "' + desc + '"...'
    $nesting_depth += 1
    result = block.call
  puts indent + '..." ' + desc + '" finished, returning: ' + result.to_s
end

log 'outer block' do
  log 'some little block' do
    log 'teeny-tiny block' do
      'evol fo stol'.reverse
    end
    thing = 42
  end
  log 'yet another block' do
    'I love Indian food!'
  end
  this = true
  this
end

