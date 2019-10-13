# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit qmake-utils

DESCRIPTION="A Qt-based UPnP audio Control point"
HOMEPAGE="http://www.lesbonscomptes.com/upplay"
SRC_URI="http://www.lesbonscomptes.com/upplay/downloads/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
		dev-libs/expat
		dev-libs/jsoncpp
		dev-qt/qtnetwork:5
		dev-qt/qtwebkit:5
		>=media-libs/libupnpp-0.17.0
		net-libs/libupnp:0
		net-misc/curl"
RDEPEND="${DEPEND}"

src_compile() {
	eqmake5 PREFIX="/usr"
	sed -e "s:Categories=.*$:Categories=Audio;AudioVideo;:" \
                -i upplay.desktop
}
src_install() {
	emake install INSTALL_ROOT="${D}"
}
