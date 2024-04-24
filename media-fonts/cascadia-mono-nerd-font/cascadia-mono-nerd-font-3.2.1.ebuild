# Copyright 2023 Mike Rivnak

EAPI=8

inherit font

DESCRIPTION="Nerd Fonts patched version of Cascadia Mono font"
HOMEPAGE="https://github.com/ryanoasis/nerd-fonts"
SRC_URI="https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/CascadiaMono.tar.xz -> ${P}.tar.xz"

SLOT=0
LICENSE="Apache-2.0 MIT OFL-1.1"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv"

FONT_SUFFIX="ttf"

S="${WORKDIR}"

