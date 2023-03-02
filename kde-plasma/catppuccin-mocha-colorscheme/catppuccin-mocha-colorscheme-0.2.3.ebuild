# Copyright 2023 Mike Rivnak

EAPI=8

DESCRIPTION="Catppuccin theme for KDE Plasma"
HOMEPAGE="https://github.com/catppuccin/kde"
SRC_URI="https://github.com/catppuccin/kde/releases/download/v${PV}/Mocha-color-schemes.zip -> ${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="app-arch/unzip"

S="${WORKDIR}/Mocha-color-schemes"

src_install() {
	insinto /usr/share/color-schemes
	doins CatppuccinMochaRosewater.colors
}
