require_relative '../config/environment'
require 'rake'
load './Rakefile'

RSpec.configure do |config|
  config.before(:all) do
    run_rake_task('db:drop')
  end
  config.before(:each) do
    run_rake_task('db:migrate')
  end
  config.after(:each) do
    run_rake_task('db:drop')
  end
end

def run_rake_task(task)
  RAKE_APP[task].invoke
  if task == 'db:migrate' || task == 'db:drop' 
    RAKE_APP[task].reenable
  end
end