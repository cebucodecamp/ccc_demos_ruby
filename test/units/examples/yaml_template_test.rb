##
#
# Refactoring ideas:
#
# 1) Re-use template instance for multiple data input
# 2) Shorten 'compile' method in to sub-methods
# 3) Group data hashes into an array
# 4) Extract location hash to become an input data to the Template class
# 5) ...
#

require File.expand_path('../../../test_helper', __FILE__)
require 'minitest/autorun'
require 'examples'
require 'pp'

class YamlTemplateTest < MiniTest::Test
  include Examples

  def setup
    @host_data_yml = File.join(DEMOS_TEST_PATH, 'fixtures/host_data.yml')
    @dest_path = File.join(DEMOS_TEST_PATH, 'tmp/%s' % File.basename(@host_data_yml))


    @data_markj = {
        :owner => 'markj',
        :location_code => :cebu
    }

    @data_murat =  {
        :owner => 'murat',
        :location_code => :germany
    }

    @data_javier = {
      :owner => 'javier',
      :location_code => :mexico
    }

    @data_barack = {
      :owner => 'barack',
      :location_code => :usa
    }

    @data_linus = {
      :owner => 'linus',
      :location_code => :finland
    }
  end

  def test_compile_markj
    written = YamlTemplate.compile(@host_data_yml, @dest_path, @data_markj)
    assert(!written.nil?, 'written should not be nil')
    assert(written > 0, 'written should be more than 0 bytes')
  end

  def test_compile_murat
    written = YamlTemplate.compile(@host_data_yml, @dest_path, @data_murat)
    assert(!written.nil?, 'written should not be nil')
    assert(written > 0, 'written should be more than 0 bytes')
  end

  def test_compile_javier
    written = YamlTemplate.compile(@host_data_yml, @dest_path, @data_javier)
    assert(!written.nil?, 'written should not be nil')
    assert(written > 0, 'written should be more than 0 bytes')
  end
end
