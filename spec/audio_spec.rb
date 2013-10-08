require 'helper'
require 'traject/umich_format'
require 'marc'

#002725380 970   L $$aMU$$bMusic
#002725380 970   L $$aRC$$bAudio CD
#002725380 970   L $$aRL$$bAudio LP
#002725380 970   L $$aRM$$bAudio (music)
#002725380 970   L $$aRU$$bAudio

describe 'audio' do
  before do
    @record = MARC::Reader.new(support_file_path 'audio.mrc').first
    @umf = Traject::UMichFormat.new(@record)
  end

  it "gets the right bib_format" do
    assert_equal 'MU', @umf.bib_format
  end

  it "correctly identifies complex audio file" do
    assert_equal %w[MU RC RL RM RU].sort(), @umf.format_and_types
  end
end
