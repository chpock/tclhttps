# Copyright (c) 2024 Konstantin Kushnir <chpock@gmail.com>
#
# See the file "license.terms" for information on usage and redistribution
# of this file, and for a DISCLAIMER OF ALL WARRANTIES.

package require https

if { ![catch { package require mtls }] } {

    ::http::register https 443 ::mtls::socket

} elseif { $tcl_platform(platform) eq "windows" && ![catch { package require twapi }] } {

    http::register https 443 ::twapi::tls_socket

} else if { ![catch { package require tls }] } {

    http::register https 443 [list ::tls::socket -autoservername true -ssl2 false -ssl3 false]

}

package provide https 0.1.0
