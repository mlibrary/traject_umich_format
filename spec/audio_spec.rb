require 'helper'
require 'traject'
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
    @umf    = Traject::UMichFormat.new(@record)
  end

  it "gets the right bib_format" do
    assert_equal 'MU', @umf.bib_format
  end

  it "correctly identifies complex audio file" do
    assert_equal %w[MU RC RL RM RU].sort(), @umf.format_and_types
  end

  it "can translate the results" do
    tmap    = Traject::TranslationMap.new('umich/format')
    indexer = Traject::Indexer.new

    indexer.instance_eval do
      extend Traject::UMichFormat::Macros
      to_field 'formats', umich_format_and_type_codes do |rec, acc, context|
        acc.map! { |code| tmap[code] }
      end
    end
    output = indexer.map_record(@record)

    assert_equal [
                     "Music",
                     "Audio CD",
                     "Audio LP",
                     "Audio (music)",
                     "Audio"
                 ].sort(), output['formats'].sort
  end

  it "identifies a somewhat weird LP as an LP" do
    @record = MARC::Reader.new(support_file_path 'audio_lp.mrc').first
    @umf    = Traject::UMichFormat.new(@record)

    assert_equal 'MU', @umf.bib_format
    assert @umf.types.include?("RL"), "types include 'RL'"
  end

  it "identifies an audio CD from the 007 field" do
    @record = MARC::Reader.new(support_file_path 'audio_cd_007.mrc').first
    @umf    = Traject::UMichFormat.new(@record)

    puts 'types from audio_cd_007.mrc file: ' + @umf.types.join(',')
    #assert_equal 'MU', @umf.bib_format
    assert @umf.types.include?("RC"), "types include 'RC'"
  end

end

describe "macros" do

  before do
    @record  = MARC::Reader.new(support_file_path 'audio.mrc').first
    @indexer = Traject::Indexer.new
    @indexer.instance_eval do
      extend Traject::UMichFormat::Macros
    end

  end

  it "runs the format_code macro" do
    @indexer.instance_eval do
      to_field 'format_code', umich_format_code
    end
    output = @indexer.map_record(@record)
    assert_equal ['MU'], output['format_code']
  end

  it "runs the type_codes macro" do
    @indexer.instance_eval do
      to_field 'type_codes', umich_type_codes
    end
    output = @indexer.map_record(@record)
    assert_equal ['RC', 'RL', 'RM', 'RU'].sort, output['type_codes'].sort

  end

  it "runs the format_and_type_codes macro" do
    @indexer.instance_eval do
      to_field 'formats', umich_format_and_type_codes
    end
    output = @indexer.map_record(@record)

    assert_equal %w[MU RC RL RM RU].sort(), output['formats']
  end

  it "translates the format" do
    @indexer.instance_eval do
      to_field 'format', umich_format
    end
    output = @indexer.map_record(@record)
    assert_equal ['Music'], output['format']
  end

  it "translates the types" do
    @indexer.instance_eval do
      to_field 'types', umich_types
    end
    output = @indexer.map_record(@record)
    assert_equal ["Audio CD",
                  "Audio LP",
                  "Audio (music)",
                  "Audio"
                 ].sort, output['types'].sort
  end

  it "translates format/types" do
    @indexer.instance_eval do
      to_field 'ft', umich_format_and_types
    end
    output = @indexer.map_record(@record)
    assert_equal [
                     "Music",
                     "Audio CD",
                     "Audio LP",
                     "Audio (music)",
                     "Audio"
                 ].sort(), output['ft'].sort
  end
end
