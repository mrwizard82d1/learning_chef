free_memory = node['memory']['total']

file '/tmp/free' do
  content "#{free_memory} bytes free on #{Time.now}"
end
