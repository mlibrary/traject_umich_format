require 'helper'
require 'traject/umich_format'

describe "version" do
  it "must exist" do
    version = Traject::UMichFormat.const_get('VERSION')
    version.wont_be_empty
  end
end
