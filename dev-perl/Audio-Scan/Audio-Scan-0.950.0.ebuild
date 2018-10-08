# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MODULE_AUTHOR=AGRUNDMA
MODULE_VERSION=0.95
inherit perl-module

DESCRIPTION="Fast C metadata and tag reader for all common audio file formats"

SRC_URI="https://www.dropbox.com/s/7xuaoxykt0k7guv/Audio-Scan-0.95.tar.gz"

LICENSE="|| ( GPL-2 GPL-3 ) public-domain" # GPL-2+
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-solaris"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	test? (
		dev-perl/Test-Warn
	)"
#		dev-perl/Test-Pod
#		dev-perl/Test-Pod-Coverage"

SRC_TEST=do
