#
#
#   This module allows you to modify the cPanel tweak settings file.
#
#   Example usage:
#
#   tweak_settings { 'skipawstats':
#       value => '0',
#   }
#
#   Copyright (C) 2014 Craig Parker <craig@paragon.net.uk>
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; If not, see <http://www.gnu.org/licenses/>.
#
#
define tweak_settings ( $value ) {

    file { '/usr/sbin/tweaksettings':
        ensure => file,
        source => 'puppet:///modules/tweak_settings/tweaksettings.sh',
        mode   => '0755',
    } ->

    exec { "${name}-tweak":
        command => "/usr/sbin/tweaksettings \"${name}\" \"${value}\"",
        unless  => "/bin/grep \"${name}=${value}\" /var/cpanel/cpanel.config",
        require => File['/usr/sbin/tweaksettings'],
    }

}