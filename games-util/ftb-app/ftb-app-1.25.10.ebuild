EAPI=8

inherit desktop linux-info xdg rpm

DESCRIPTION="The official Feed The Beast desktop app"
HOME_PAGE="https://feed-the-beast.com/ftb-app"
SRC_URI="
	amd64? ( https://piston.feed-the-beast.com/app/${P}-x86_64.rpm -> ${P}.rpm )
	arm64? ( https://piston.feed-the-beast.com/app/${P}-aarch64.rpm -> ${P}.rpm )
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
	rpm_unpack ${P}.rpm
	mv opt/FTB\ Electron\ App/ opt/ftb-app/
}

src_install() {
	insinto /opt/ftb-app
	doins opt/ftb-app/*

	exeinto /opt/ftb-app
	doexe opt/ftb-app/ftb-app

	insinto /opt/ftb-app/locales
	doins opt/ftb-app/locales/*.pak

	insinto /opt/ftb-app/resources
	doins opt/ftb-app/resources/*

	dosym /opt/ftb-app/ftb-app /usr/bin/ftb-app

	insinto /usr/share/applications
	doins usr/share/applications/ftb-app.desktop

	for size in 16 32 48 64 128 256 512; do
		insinto /usr/share/icons/hicolor/${size}x${size}/apps
		doins usr/share/icons/hicolor/${size}x${size}/apps/ftb-app.png
	done
}
