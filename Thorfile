require File.expand_path('../config/boboot', __FILE__)
require 'thor'

LOAD_THOR_FILES = [
  File.join(DEMOS_ROOT_PATH, 'thorlib/hello.rb')
]

LOAD_THOR_FILES.each do |t|
  Thor::Util.load_thorfile(t)
end
