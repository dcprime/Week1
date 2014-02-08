# Grandfather clock program

def hourly block_description, &block
  current_time = Time.new.hour
    if current_time > 12
      current_time = current_time - 12
    end
  current_time.times do
    block.call
  end
end

hourly 'dong' do
  puts 'DONG!' 
end

hourly 'walk the chicken' do
  i = 1
  puts 'Walking the chicken, round ' + i.to_s
  i += 1
end

