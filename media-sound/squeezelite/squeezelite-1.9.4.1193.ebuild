# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils user flag-o-matic git-r3 systemd

DESCRIPTION="Lightweight headless squeezebox client emulator"
HOMEPAGE="https://github.com/ralph-irving/squeezelite"

EGIT_REPO_URI="https://github.com/ralph-irving/squeezelite.git"
EGIT_COMMIT="f5030482fcbb797e3927aba37d94d57dfa1e72b4"
# see VERSION #def in squeezelite.h

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64 ~arm"
IUSE="aac dsd ffmpeg flac mad mpg123 pulseaudio resample visexport vorbis lirc gpio systemd"

# ffmpeg provides alac and wma codecs
DEPEND="media-libs/alsa-lib
		flac? ( media-libs/flac )
		ffmpeg? ( media-video/ffmpeg )
		vorbis? ( media-libs/libvorbis )
		mad? ( media-libs/libmad )
		mpg123? ( media-sound/mpg123 )
		aac? ( media-libs/faad2 )
		resample? ( media-libs/soxr )
		visexport? ( media-sound/jivelite )
		pulseaudio? ( media-plugins/alsa-plugins[pulseaudio] )
		lirc? ( app-misc/lirc )
"
RDEPEND="${DEPEND}
		 media-sound/alsa-utils"

pkg_setup() {
	enewgroup squeezelite
	if use pulseaudio ; then
		enewuser squeezelite -1 -1 "/dev/null" "squeezelite"
	else
		enewuser squeezelite -1 -1 "/dev/null" "squeezelite,audio"
	fi
}

src_prepare () {
	epatch "${FILESDIR}/${P}-gentoo-optional-codecs.patch"
	epatch "${FILESDIR}/${P}-gentoo-optional-codecs-decode.patch"
	eapply_user
}

src_compile() {
	export OPTS=""

	if use dsd; then
		OPTS+=" -DDSD"
		einfo "dsd support enabled via dsd2pcm"
	fi

	if use ffmpeg; then
		OPTS+=" -DFFMPEG"
		einfo "alac and wma support enabled via ffmpeg"
	fi

	if use resample; then
		OPTS+=" -DRESAMPLE"
		einfo "resample support enabled via soxr"
	fi

	if use visexport; then
		OPTS+=" -DVISEXPORT"
		einfo "audio data export to jivelite support enabled"
	fi

	if use lirc; then
                OPTS+=" -DIR"
                einfo "infra-red support enabled via lirc"
        fi

	if use gpio; then
                OPTS+=" -DGPIO"
                einfo "Control of Raspberry pi GPIO for amplifier power - Launch script on power status change from LMS"
        fi

	# Configure other optional codec support; this is added to the original
	# source via a patch in this ebuild at present.
	if ! use flac; then
		append-cflags "-DSL_NO_FLAC"
		einfo "FLAC support disabled; add 'flac' USE flag if you need it"
	fi
	if ! use vorbis; then
		append-cflags "-DSL_NO_OGG"
		einfo "Ogg/Vorbis support disabled; add 'vorbis' USE flag if you need it"
	fi
	if ! use mad; then
		append-cflags "-DSL_NO_MAD"
	fi
	if ! use mpg123; then
		append-cflags "-DSL_NO_MPG123"
	fi
	if ! use mad && ! use mpg123; then
		einfo "MP3 support disabled; add 'mad' (recommended)"
		einfo "  or 'mpg123' USE flag if you need it"
	fi
	if ! use aac; then
		OPTS+=" -DNO_FAAD"
		einfo "AAC support disabled; add 'aac' USE flag if you need it"
	fi

	# Build it
	emake || die "emake failed"
}

src_install() {
	dobin squeezelite
	dobin ${FILESDIR}/pasqueezelite
	dodoc LICENSE.txt

	newconfd "${FILESDIR}/${PN}.conf.d" "${PN}"
	if use systemd; then
	systemd_dounit "${FILESDIR}/${PN}.service"
	else
	newinitd "${FILESDIR}/${PN}.init.d" "${PN}"
 fi
}

pkg_postinst() {
	elog "squeezelite can be started with the following command (OpenRC):"
	elog "\t/etc/init.d/squeezelite start"
	elog "or (systemd):"
	elog "\tsystemctl start squeezelite"
	elog ""
	elog "squeezelite can be automatically started on each boot"
	elog "with the following command (OpenRC):"
	elog "\trc-update add squeezelite default"
	elog "or (systemd):"
	elog "\tsystemctl enable squeezelite"
	elog ""
	elog "Edit /etc/conf.d/squeezelite to customise -- in particular"
	elog "you may want to set the audio device to be used."
}
