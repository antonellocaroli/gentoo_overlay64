# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils unpacker user


DESCRIPTION="music player"
HOMEPAGE="https://roonlabs.com/index.html"
SRC_URI="http://download.roonlabs.com/builds/RoonBridge_linuxx64.tar.bz2 -> ${P}.tar.bz2"

SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"

RDEPEND=">=media-libs/alsa-lib-1.0.27"

DEPEND="${RDEPEND}"


S="${WORKDIR}"
QA_PREBUILT="usr/sbin/RoonBridge"


src_install() {
  cp -r RoonBridge "${D}"
  newinitd "${FILESDIR}/roonbridge.init.d" "roonbridge"
}

pkg_postinst() {
	# Provide some post-installation tips.
	elog""
	elog""
	elog""
	elog "If you want start RoonBridge automatically on system boot:"
	elog "  rc-update add roonbridge default"
	elog""
	elog""
}
