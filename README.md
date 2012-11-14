Description
===========
The ```gsettings``` resource can be used for manipulation of Gnome configuration settings 
via the gsettings configuration tool added in Gnome v3.

Usage
=====

    gsettings "org.gnome.desktop.interface" do
      option "monospace-font-name"
      value "Monospace 14"
      user "bob"
    end

* schema - used as the name attribute above, the dotted notation schema that contains the 
attribute
* option - the key being set with a new value
* value - the new value for the key, this should be a pure ruby type. the gsettings resource 
will automatically marshal the value into the GVariant format required by the underlying
gsettings command line tool
* user - User name for whom the setting applies to, should be a valid account on the system.

Examples
========

Swap Ctrl and Caps Lock key
---------------------------

    gsettings "org.gnome.libgnomekbd.keyboard" do
      option "options"
      user "bob"
      value ["ctrl\tctrl:nocaps"]
    end


License and Author
==================

Author:: Mark Roddy (<markroddy a t gmail d-o-t com>)

Copyright:: 2012, Mark Roddy

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
