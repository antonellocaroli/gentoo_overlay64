# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker

MY_PN=${PN/-bin/}

DESCRIPTION="HQPlayer - upsampling multichannel audio player"
HOMEPAGE="http://www.signalyst.com/consumer.html"
SRC_URI="http://www.signalyst.eu/bins/hqplayer/bionic/${MY_PN}_${PV}-5_amd64.deb"

LICENSE="Signalyst"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"

RDEPEND=">=sys-devel/gcc-5.1.0[openmp]
	>=dev-qt/qtcore-5.5.0
	>=dev-qt/qtgui-5.5.0
	>=dev-qt/qtnetwork-5.5.0
	>=dev-qt/qtdeclarative-5.5.0
	>=dev-qt/qtquickcontrols2-5.11.3"

DEPEND="${RDEPEND}"

S="${WORKDIR}"
QA_PREBUILT="usr/bin/hqp-control usr/bin/hqplayer"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	mv usr "${D}" || die
}
