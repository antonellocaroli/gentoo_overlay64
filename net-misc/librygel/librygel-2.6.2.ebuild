# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker user

MY_PN=${PN/}

DESCRIPTION="Rygel is an open source UPnP/DLNA MediaServer"
HOMEPAGE="https://wiki.gnome.org/Projects/Rygel"
SRC_URI="amd64? ( https://www.dropbox.com/s/pgavn1dqk0jtv10/librygel-2.6.2.tar.bz2 )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"



S="${WORKDIR}"



src_prepare () {
(chmod +x usr/lib/*)
eapply_user
}


src_install() {
	mv usr "${D}" || die
	dosym /usr/lib/librygel-core-2.6.so.2.0.4 /usr/lib/librygel-core-2.6.so
	dosym /usr/lib/librygel-core-2.6.so.2.0.4 /usr/lib/librygel-core-2.6.so.2
	dosym /usr/lib/librygel-db-2.6.so.2.0.4 /usr/lib/librygel-db-2.6.so
	dosym /usr/lib/librygel-db-2.6.so.2.0.4 /usr/lib/librygel-db-2.6.so.2
	dosym /usr/lib/librygel-renderer-2.6.so.2.0.4 /usr/lib/librygel-renderer-2.6.so
	dosym /usr/lib/librygel-renderer-2.6.so.2.0.4 /usr/lib/librygel-renderer-2.6.so.2
	dosym /usr/lib/librygel-renderer-gst-2.6.so.2.0.4 /usr/lib/librygel-renderer-gst-2.6.so
	dosym /usr/lib/librygel-renderer-gst-2.6.so.2.0.4 /usr/lib/librygel-renderer-gst-2.6.so.2
	dosym /usr/lib/librygel-ruih-2.0.so.1.0.0 /usr/lib/librygel-ruih-2.0.so
	dosym /usr/lib/librygel-ruih-2.0.so.1.0.0 /usr/lib/librygel-ruih-2.0.so.1
	dosym /usr/lib/librygel-server-2.6.so.2.0.4 /usr/lib/librygel-server-2.6.so
	dosym /usr/lib/librygel-server-2.6.so.2.0.4 /usr/lib/librygel-server-2.6.so.2
}

