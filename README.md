puppet-tweak_settings
=====================

Puppet module to edit/update cPanel's tweak settings file, allowing you to enforce the same cPanel configuration across multiple servers.

Available settings are http://docs.cpanel.net/twiki/bin/view/AllDocumentation/InstallationGuide/AdvancedOptions#How%20to%20pre-configure%20cPanel%20%20WHM

You just need to specify the name of the setting and the value, example usage:

    tweak_settings { 'skipawstats':
        value => '0',
    }

Copyright (C) 2014 Craig Parker <craig@paragon.net.uk>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; If not, see <http://www.gnu.org/licenses/>.