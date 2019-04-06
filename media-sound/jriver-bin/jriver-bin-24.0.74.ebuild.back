# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker user systemd

MY_PN=${PN/-bin/}

DESCRIPTION="Jriver Media Center - the most comprehensive and seamless software available for managing and playing your media"
HOMEPAGE="https://jriver.com/index.html"
SRC_URI="https://files.jriver.com/mediacenter/channels/v24/latest/MediaCenter-24.0.74-amd64.deb"

LICENSE="Jriver,Inc."
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"

IUSE="systemd"

RDEPEND=">=dev-libs/glib-2.37.3
	>=media-libs/alsa-lib-1.0.28
	>=x11-libs/libX11-1.6.7
	>=x11-libs/libXext-1.3.3
	>=x11-libs/libxcb-1.13.1
	>=x11-libs/libXdmcp-1.1.2
	>=x11-libs/gtk+-3.24.1
	>=media-libs/mesa-18.2.8
	>=x11-libs/pango-1.42.4
	>=x11-libs/cairo-1.16.0
	>=x11-misc/xdg-utils-1.1.3
	>=media-libs/gst-plugins-base-1.14.4
	>=dev-libs/nss-3.40.1"

DEPEND="${RDEPEND}"

S="${WORKDIR}"
QA_PREBUILT="usr/bin/mediacenter24"


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
	mv etc usr "${D}" || die
}
