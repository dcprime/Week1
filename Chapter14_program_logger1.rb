# Program logger program

def log desc, &block
  puts 'Beginning "' + desc + '"...'
    result = block.call
  puts 'Finished running" ' + desc + '" - Returned: ' + result.to_s
end

log 'outer block' do
  log 'some little block' do
    thing = 5
  end
  log 'yet another block' do
    'These instructions were confusing'
  end
  this = false
  this
end

