require 'traject'
require 'traject/umich_format/bib_format'
require 'traject/umich_format/bib_types'

# Encapsulates logic that uses University of Michigan University Library
# rules to determine both bib format (book, serial, visual
# material, etc.) and type, a more expansive list including both format
# (blu-ray, microform) and more semantic categories (bibliography,
# conference)

class Traject::UMichFormat


  # @!attribute [r] record
  #   The record passed into the constructor
  # @!attribute [r] bib_format
  #   The bib format code as computed from the passed record
  # @!attribute [r] types
  #   A (possibly empty) array of type codes as computed from record data
  attr_reader :bib_format, :record, :types

  # Construct a Formats object from the given record, calcuclating
  # the bib_format and types
  #
  # @param [MARC::Record] record
  def initialize(marc_record)
    @record     = marc_record
    @bib_format = BibFormat.new(record).code
    @types      = BibTypes.new(record).codes
  end

end
