# Copyright 2023 Mike Rivnak

EAPI=8

inherit font

DESCRIPTION="The latest monospaced font from Microsoft for Windows Terminal and Visual Studio"
HOMEPAGE="https://github.com/microsoft/cascadia-code"
SRC_URI="https://github.com/microsoft/cascadia-code/releases/download/v${PV}/CascadiaCode-${PV}.zip -> ${P}.zip"

SLOT=0
LICENSE="OFL-1.1"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv"
IUSE="nerd-fonts powerline"

BDEPEND="app-arch/unzip"

FONT_SUFFIX="ttf"

S="${WORKDIR}/ttf"

src_prepare() {
	default
	cd "${S}"
	rm -r "${S}/static" || die
	rm CascadiaCodeItalic.ttf \
		CascadiaCodeNFItalic.ttf \
		CascadiaCodeNF.ttf \
		CascadiaCodePLItalic.ttf \
		CascadiaCodePL.ttf \
		CascadiaCode.ttf \
		|| die

	if ! use nerd-fonts; then
		rm CascadiaMonoNFItalic.ttf CascadiaMonoNF.ttf || die
	fi

	if ! use powerline; then
		rm CascadiaMonoPLItalic.ttf CascadiaMonoPL.ttf || die
	fi
}

