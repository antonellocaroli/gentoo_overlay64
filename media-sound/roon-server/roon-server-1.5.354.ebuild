# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils unpacker user


DESCRIPTION="music player sever"
HOMEPAGE="https://roonlabs.com/index.html"
SRC_URI="http://download.roonlabs.com/builds/RoonServer_linuxx64.tar.bz2  -> ${P}.tar.bz2"

SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"

RDEPEND=">=media-libs/alsa-lib-1.0.27"

DEPEND="${RDEPEND}"


S="${WORKDIR}"
QA_PREBUILT="usr/sbin/RoonServer"


src_install() {
  cp -r RoonServer "${D}"
  newinitd "${FILESDIR}/roonserver.init.d" "roonserver"
}

pkg_postinst() {
	# Provide some post-installation tips.
	elog""
	elog""
	elog""
	elog "If you want start RoonServer automatically on system boot:"
	elog "  rc-update add roonserver default"
	elog""
	elog""
}
