EAPI=8

inherit desktop

DESCRIPTION="The intuitive, fast, and beautiful cross-platform Git client."
HOMEPAGE="https://www.gitkraken.com/"

LICENSE="axosoft electron"

SRC_URI="https://release.axocdn.com/linux/GitKraken-v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist mirror splitdebug strip"
IUSE="
	gnome
	kde
"

DEPEND=""
RDEPEND="
    x11-libs/gtk+
    app-crypt/libsecret
    x11-libs/libxkbfile
    dev-libs/nss
    x11-misc/shared-mime-info
    x11-misc/xdg-utils
    dev-libs/glib
    gnome? ( gnome-base/gnome-keyring )
    kde? ( kde-frameworks/kwallet )
    "
BDEPEND=""

QA_PREBUILT="opt/${PN}/${PN}"

S="${WORKDIR}/${PN}"

src_install() {
	newicon ${PN}.png ${PN}.png
	newicon -s 512 ${PN}.png ${PN}.png
	domenu "${FILESDIR}"/com.axosoft.GitKraken.desktop

	insinto /opt/${PN}
	doins -r .
	fperms +x $(find . -type f -executable | sed "s|^.|/opt/${PN}|")
	dosym /opt/${PN}/${PN} /usr/bin/${PN}
}
