# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %(app lib config test spec feature)

## Uncomment to clear the screen before every task
# clearing :on


# [bundle exec] guard -g static

group :static do
  guard 'rake', :task => 'spec' do
    watch(%r{^manifests\/(.+)\.pp$})
    watch(%r{^spec\/classes\/(.+)\_spec\.rb$})
  end
end


# [bundle exec] guard -g acceptance
group :acceptance do
  guard 'rake', :task => 'beaker' do
    watch(%r{^manifests\/(.+)\.pp$})
    watch(%r{^spec\/acceptance\/(.+)\_spec\.rb$})
  end
end



# vim: ft=ruby
