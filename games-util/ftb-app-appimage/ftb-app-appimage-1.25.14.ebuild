EAPI=8

inherit desktop linux-info xdg

MY_PN=${PN/-appimage}
MY_P=${MY_PN}-${PV}
DESCRIPTION="The official Feed The Beast desktop app"
HOME_PAGE="https://feed-the-beast.com/ftb-app"
SRC_URI="
	https://github.com/FTBTeam/FTB-App/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.tar.gz
	amd64? ( https://piston.feed-the-beast.com/app/${MY_P}-x86_64.AppImage -> ${MY_P}.AppImage )
	arm64? ( https://piston.feed-the-beast.com/app/${MY_P}-arm64.AppImage -> ${MY_P}.AppImage )
"

LICENSE="FTB"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="
	app-accessibility/at-spi2-core
	app-crypt/libsecret
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/libayatana-indicator
	dev-libs/nspr
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/mesa
	net-print/cups
	sys-apps/dbus
	sys-apps/util-linux
	sys-libs/glibc
	x11-libs/cairo
	x11-libs/libdrm
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/libxshmfence
	x11-libs/pango
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_unpack() {
	default
	cp "${DISTDIR}/${MY_P}.AppImage" "${S}/ftb-app.AppImage"
}

src_install() {
	insinto /opt/ftb-app
	doexe ftb-app.AppImage

	FTB_SRC_DIR="${S}/FTB-App-${PV}"

	dosym /opt/ftb-app/ftb-app.AppImage /usr/bin/ftb-app

	domenu ${FILESDIR}/ftb-app.desktop

	for size in 16 32 48 64 128 256 512; do
		newicon --size $size ${FTB_SRC_DIR}/resources/icons/${size}x${size}.png ftb-app.png
	done
}
