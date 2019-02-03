# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker

MY_PN=${PN/-bin/}

DESCRIPTION="Qobuz - player"
HOMEPAGE="https://www.qobuz.com"
SRC_URI="https://github.com/nlarche/qobuz-desktop-player/releases/download/v0.1.0/${MY_PN}_${PV}_amd64.deb"

LICENSE="Qobuz"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"

RDEPEND=">=dev-libs/libappindicator-12.10.0-r301
	>=x11-libs/libnotify-0.7.7-r1"

DEPEND="${RDEPEND}"

S="${WORKDIR}"
QA_PREBUILT="opt/Qobuz Desktop player/qobuz-desktop-player"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	mv usr opt "${D}" || die
	rm "${D}usr/share/doc/qobuz-desktop-player/changelog.gz"
}
