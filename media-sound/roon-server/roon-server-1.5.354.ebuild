# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils unpacker user systemd


DESCRIPTION="music player sever"
HOMEPAGE="https://roonlabs.com/index.html"
SRC_URI="http://download.roonlabs.com/builds/RoonServer_linuxx64.tar.bz2  -> ${P}.tar.bz2"

SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"

IUSE="systemd"

RDEPEND=">=media-libs/alsa-lib-1.0.27"

DEPEND="${RDEPEND}"


S="${WORKDIR}"
QA_PREBUILT="usr/sbin/RoonServer"


src_install() {
  cp -r RoonServer "${D}"
  if use systemd; then
  systemd_dounit "${FILESDIR}/roonserver.service"
  else
  newinitd "${FILESDIR}/roonserver.init.d" "roonserver"
  fi
}

pkg_postinst() {
	# Provide some post-installation tips.
  elog ""
	elog ""
	elog ""
  elog "RoonServer can be started with the following command (OpenRC):"
  elog "\t/etc/init.d/roonserver start"
  elog "or (systemd):"
  elog "\tsystemctl start roonserver"
  elog ""
  elog "RoonServer can be automatically started on each boot"
  elog "with the following command (OpenRC):"
  elog "\trc-update add roonserver default"
  elog "or (systemd):"
  elog "\tsystemctl enable roonserver"
  elog ""
  elog ""
	elog ""
	elog ""
}
