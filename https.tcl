# Copyright (c) 2024 Konstantin Kushnir <chpock@gmail.com>
#
# See the file "license.terms" for information on usage and redistribution
# of this file, and for a DISCLAIMER OF ALL WARRANTIES.

package require http

if { ![catch { package require mtls }] } {

    ::http::register https 443 ::mtls::socket

} elseif { $tcl_platform(platform) eq "windows" && ![catch { package require twapi }] } {

    http::register https 443 ::twapi::tls_socket

} elseif { ![catch { package require tls }] } {

    http::register https 443 [list ::tls::socket -autoservername true -ssl2 false -ssl3 false]

} else {

    return -code error "could not find any TLS/SSL provider.\
        Please install tclmtls[expr { $tcl_platform(platform) eq "windows" ? ", twapi" : "" }]\
        or tcltls."

}

package provide https 0.1.0
