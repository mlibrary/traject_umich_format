require 'traject'
require 'traject/umich_format'

module Traject::UMichFormat::Macros
  def umich_format_code
    ->(record, acc, context) do
      context.clipboard[:umich_format_obj] ||= Traject::UMichFormat.new(record)
      acc << context.clipboard[:umich_format_obj].bib_format
    end
  end

  def umich_format
    tmap = Traject::TranslationMap.new('umich/format')
    ->(record, acc, context) do
      context.clipboard[:umich_format_obj] ||= Traject::UMichFormat.new(record)
      acc << tmap[context.clipboard[:umich_format_obj].bib_format]
    end
  end

  def umich_type_codes
    ->(record, acc, context) do
      context.clipboard[:umich_format_obj] ||= Traject::UMichFormat.new(record)
      acc.concat context.clipboard[:umich_format_obj].types
    end
  end

  def umich_types
    tmap = Traject::TranslationMap.new('umich/format')
    ->(record, acc, context) do
      context.clipboard[:umich_format_obj] ||= Traject::UMichFormat.new(record)
      acc.concat context.clipboard[:umich_format_obj].types.map{|x| tmap[x]}
    end

  end

  def umich_format_and_type_codes
    ->(record, acc, context) do
      context.clipboard[:umich_format_obj] ||= Traject::UMichFormat.new(record)
      acc.concat context.clipboard[:umich_format_obj].format_and_types
    end
  end

  def umich_format_and_types
    tmap = Traject::TranslationMap.new('umich/format')
    ->(record, acc, context) do
      context.clipboard[:umich_format_obj] ||= Traject::UMichFormat.new(record)
      acc.concat context.clipboard[:umich_format_obj].format_and_types.map{|x| tmap[x]}.uniq
    end
  end


end
