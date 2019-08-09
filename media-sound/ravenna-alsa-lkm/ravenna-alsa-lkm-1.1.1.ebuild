# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit git-r3


DESCRIPTION="music player"
HOMEPAGE="https://roonlabs.com/index.html"
EGIT_REPO_URI="https://bitbucket.org/MergingTechnologies/ravenna-alsa-lkm.git"


LICENSE="roonlabs"

SLOT="0"
KEYWORDS="~amd64 ~arm64 ~arm"

IUSE="systemd"

RDEPEND=">=media-libs/alsa-lib-1.0.27"

DEPEND="${RDEPEND}"


S="${WORKDIR}"
MY_PN=ravenna-alsa-lkm

#src_install() {
#  cp -r RoonBridge "${D}"
#  if use systemd; then
#  systemd_dounit "${FILESDIR}/roonbridge.service"
#  else
#  newinitd "${FILESDIR}/roonbridge.init.d" "roonbridge"
#  fi
#}


#src_install() {
#  insinto "/opt/${PN}/"
#  insopts -m755
#  doins -r ravenna-alsa-daemon/*
#  if use systemd; then
#      systemd_dounit "${FILESDIR}/roonbridge.service"
#  else
#      newinitd "${FILESDIR}/roonbridge.init.d" "roonbridge"
#  fi
#}


src_install() {
  insinto "/opt/${PN}/"
  insopts -m755
  doins -r ravenna-alsa-lkm-1.1.1/*
  if use systemd; then
      systemd_dounit "${FILESDIR}/ravenna-alsa-lkm.service"
  else
        newinitd "${FILESDIR}/ravenna-alsa-lkm.init.d" "ravenna-alsa-lkm"
  fi
}



pkg_postinst() {
	# Provide some post-installation tips.
	elog ""
	elog ""
	elog ""
  elog "RoonBridge can be started with the following command (OpenRC):"
  elog "\t/etc/init.d/roonbridge start"
  elog "or (systemd):"
  elog "\tsystemctl start roonbridge"
  elog ""
  elog "RoonBridge can be automatically started on each boot"
  elog "with the following command (OpenRC):"
  elog "\trc-update add roonbridge default"
  elog "or (systemd):"
  elog "\tsystemctl enable roonbridge"
  elog ""
  elog ""
	elog ""
	elog ""
}
