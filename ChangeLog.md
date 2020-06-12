### 0.4.4 / 2020-06-10

* Include "i" bib level in defs for formats other than bk or se.

### 0.4.0 / 2017-12-01

* Improve recognition of audio and CD formats

### 0.3.0 / 2017-04-13

* Call `uniq` on the list of formats before it's returned, since _serial_ can sometimes come
from two non-mutually-exclusive places. Thanks to @timothyprettyman.

### 0.2.0 / 2013-11-13

* Make LP format detection more liberal (thank you for pull request, @jrochkind)
* Narrow definition of DVD to avoid getting DVD-ROMs incorrectly (again, with the @jrochkind)

### 0.1.3 / 2013-10-22

* Call #uniq! before exiting from each indiviual type checker to allow easier calling of just the ones you want.
* Refact type#codes into its own method instead of doing all the work on initialization

### 0.1.2 / 2013-10-22

* Fix types logic so tests against different characters in the 007 or 006 must come from the
same field (e.g., not 006[1]='s' in one 006, and 006[2]='t' in another 006). Affects VD, VH, 
CF, and RC types.

### 0.1.1 / 2013-10-14

* Fixed README to have correct load path (traject/umich_format, not traject_umich_format)

### 0.1.0 / 2013-10-07

* Initial release:

