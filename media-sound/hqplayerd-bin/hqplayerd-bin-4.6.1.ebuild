# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker user systemd

MY_PN=${PN/-bin/}

DESCRIPTION="HQPlayer Embedded - upsampling multichannel audio player"
HOMEPAGE="http://www.signalyst.com/consumer.html"
SRC_URI="https://www.signalyst.eu/bins/hqplayerd/stretch/${MY_PN}_${PV}-21_amd64.deb"

LICENSE="Signalyst"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"

IUSE="systemd"

RDEPEND=">=dev-libs/glib-2.37.3
	>=media-libs/libgmpris-2.2.1
	>=media-libs/alsa-lib-1.0.16
	>=media-libs/flac-1.3.0
	>=media-libs/libogg-1.3.3
	>=net-misc/rygel-0.34.0"

DEPEND="${RDEPEND}"

S="${WORKDIR}"
QA_PREBUILT="usr/bin/hqplayerd"


#pkg_setup() {
#	if use !systemd; then
#		enewgroup hqplayerd
#		enewuser hqplayerd -1 -1 "/dev/null" "hqplayerd,audio"
#	fi
#}

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	mv etc lib usr var "${D}" || die
	rm "${D}usr/share/doc/hqplayerd/changelog.Debian.gz"
	if use systemd; then
		systemd_dounit "${FILESDIR}/${MY_PN}.service"
	else
		newinitd "${FILESDIR}/${MY_PN}.init.d" "${MY_PN}"
	fi
}

pkg_postinst() {
	# Provide some post-installation tips.
	elog ""
	elog ""
	elog ""
  elog "HQPlayer Embedded can be started with the following command (OpenRC):"
  elog "\t/etc/init.d/hqplayerd start"
  elog "or (systemd):"
  elog "\tsystemctl start hqplayerd"
  elog ""
  elog "NetworkAudiod can be automatically started on each boot"
  elog "with the following command (OpenRC):"
  elog "\trc-update add hqplayerd default"
  elog "or (systemd):"
  elog "\tsystemctl enable hqplayerd"
  elog ""
  elog ""
	elog ""
}
