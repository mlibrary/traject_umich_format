require 'helper'
require 'traject'
require 'traject/umich_format'
require 'marc'


describe "video" do
  describe "DVD-ROM actual video" do
    before do 
      @record = MARC::Reader.new(support_file_path 'video_dvd_rom.mrc').first
      @umf    = Traject::UMichFormat.new(@record)
    end

    it "is marked type VD" do
      assert @umf.types.include?("VD"), "includes VD"
    end

  end


  describe "DVD-ROM non-video" do
    before do 
      @record = MARC::Reader.new(support_file_path 'dvd_rom.mrc').first
      @umf    = Traject::UMichFormat.new(@record)
    end

    it "is not marked as type VD" do
      refute @umf.types.include?("VD"), "does not include VD"
    end
  end

end