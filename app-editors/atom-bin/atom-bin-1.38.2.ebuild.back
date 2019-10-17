# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker

MY_PN=${PN/-bin/}

DESCRIPTION="Atom - A hackable text editor for the 21st Century"
HOMEPAGE="https://atom.io/"
SRC_URI="https://github.com/atom/atom/releases/download/v${PV}/${MY_PN}-amd64.deb"

LICENSE="atom.io"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"

RDEPEND=">=dev-vcs/git-2.19.2
	>=gnome-base/gconf-3.2.6-r4
	>=x11-libs/gtk+-2.24.32-r1
	>=virtual/libudev-215-r1
	>=dev-libs/libgcrypt-1.8.3
	>=x11-libs/libnotify-0.7.7-r1
	>=x11-libs/libXtst-1.2.3-r1
	>=dev-libs/nss-3.40.1-r1
	>=dev-lang/python-3.5.5
	>=gnome-base/gvfs-1.32.2
	>=x11-misc/xdg-utils-1.1.1-r1
	>=sys-libs/libcap-2.25
	>=x11-misc/xcb-2.4-r1
	>=x11-libs/libXv-1.0.11-r1
	>=media-libs/alsa-lib-1.1.2
	>=x11-libs/libxkbfile-1.0.9-r2
	>=net-misc/curl-7.64.0"

DEPEND="${RDEPEND}"

S="${WORKDIR}"
QA_PREBUILT="usr/bin/atom usr/bin/apm"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	mv usr "${D}" || die
}
