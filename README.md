# traject_umich_format

Opnionated macros to provide bibliographic format/types based on information in the
MARC bibliographic record, in the manner of the University of Michigan
University Library

* [Homepage](https://github.com/billdueber/traject_umich_format#readme)
* [Issues](https://github.com/billdueber/traject_umich_format/issues)
* [Documentation](http://rubydoc.info/gems/traject_umich_format/frames)
* [Email](mailto:bill at dueber.com)

## Description

*Note* This code is designed to be used with the [traject](http://github.com/jrochkind/traject)
indexing system, and relies on it to run.


## Examples

```ruby

# A traject configuration file
require 'traject'
require 'traject_umich_format'
extend Traject::UMichFormat::Macros

to_field 'id', extract_marc('001', :first=>true)
to_field 'bib_format', umich_format
to_field 'bib_types', umich_types
to_field 'bib_formats_and_types', umich_format_and_types



```




## Requirements

## Install

    $ gem install traject_umich_format

## Copyright

Copyright (c) 2013 Bill Dueber

See {file:LICENSE.txt} for details.
