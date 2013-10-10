# traject_umich_format
* [Homepage](https://github.com/billdueber/traject_umich_format#readme)
* [Issues](https://github.com/billdueber/traject_umich_format/issues)
* [Documentation](http://rubydoc.info/gems/traject_umich_format/frames)
* [Email](mailto:bill at dueber.com)


Opnionated macros to provide bibliographic format/types based on information in the
MARC bibliographic record, in the manner of the University of Michigan
University Library.

We at UMich use ths to populate facets in our discovery layer.


*Note* This code is designed to be used with the [traject](http://github.com/jrochkind/traject)
indexing system, and relies on it to run.


## Description

Looks at the values in a MARC record to determine a format and set of types for the object represented by the record.

### Bib Formats

Each record is assigned exactly one format. Raw, untranslated codes are provided in brackets.

* Book [BK]
* Data File [CF]
* Visual Material [VM]
* Music [MU]
* Map [MP]
* Serial [SE]
* Mixed Materials [MX]
* No match [XX]

### Bib Types

Additionally, each record may have one or more of the following more specific types associated with it.

* Archive [MV]
* Audio  (music) [RM]
* Audio  (spoken word) [RS]
* Audio [RU]
* Audio CD [RC]
* Audio LP [RL]
* Biography [BI]
* CDROM [CR]
* Conference [XC]
* Dictionaries [DI]
* Directories [DR]
* Encyclopedias [EN]
* Journal [AJ]
* Manuscript [MW]
* Maps-Atlas [MN]
* Microform [WM]
* Motion Picture [VL]
* Music [MU]
* Musical Score [MS]
* Newspaper [AN]
* Photographs & Pictorial Works [PP]
* Serial [SX]
* Software [CS]
* Statistics [XS]
* Unknown  [XX]
* Video  (Blu-ray) [VB]
* Video  (DVD) [VD]
* Video  (VHS) [VH]
* Video Games [VG]


## A sample traject configuration file

```ruby
require 'traject'
require 'traject_umich_format'
extend Traject::UMichFormat::Macros

to_field 'id', extract_marc('001', :first=>true)
to_field 'bib_format', umich_format
to_field 'bib_types', umich_types
to_field 'bib_formats_and_types', umich_format_and_types

```


## Install

    $ gem install traject_umich_format

## Copyright

Copyright (c) 2013 Bill Dueber

See [LICENSE.txt](LICENSE.txt) for details.
