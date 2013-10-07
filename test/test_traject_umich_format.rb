require 'helper'
require 'traject_umich_format'

class TestTrajectUmichFormat < Test::Unit::TestCase

  def test_version
    version = TrajectUmichFormat.const_get('VERSION')

    assert !version.empty?, 'should have a VERSION constant'
  end

end
