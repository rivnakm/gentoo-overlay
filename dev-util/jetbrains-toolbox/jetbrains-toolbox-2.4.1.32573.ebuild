EAPI=8

inherit linux-info desktop wrapper

DESCRIPTION="Save time and effort maintaining your IDEs, by downloading a patch or a set of patches instead of the full package download. Everything updates in the background while you never stop coding."
HOMEPAGE="https://www.jetbrains.com/toolbox-app/"

LICENSE="
	|| ( jetbrains_business-4.0 jetbrains_individual-4.2 jetbrains_educational-4.0 jetbrains_classroom-4.2 jetbrains_opensource-4.2 )
	Apache-1.1 Apache-2.0 BSD BSD-2 CC0-1.0 CDDL CPL-1.0 GPL-2-with-classpath-exception GPL-3 ISC LGPL-2.1 LGPL-3 MIT MPL-1.1 OFL PSF-2 trilead-ssh UoI-NCSA yFiles yourkit
"

SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="bindist mirror splitdebug"
IUSE="
	dbus
	gtk
"
QA_PREBUILT="usr/bin/${PN}"
RDEPEND="
	sys-fs/fuse:0
	media-libs/mesa
	x11-libs/libXi
	x11-libs/libXrender
	x11-libs/libXtst
	media-libs/fontconfig
"

SRC_URI="
	amd64? ( https://download.jetbrains.com/toolbox/${P}.tar.gz )
	arm64? ( https://download.jetbrains.com/toolbox/${P}-arm64.tar.gz -> ${P}.tar.gz )
"

src_install() {
	dobin jetbrains-toolbox

	make_desktop_entry "${PN}" "JetBrains Toolbox" "${PN}" "Development;IDE;"
}
