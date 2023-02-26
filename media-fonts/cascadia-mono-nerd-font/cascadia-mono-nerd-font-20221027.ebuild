# Copyright 2023 Mike Rivnak

EAPI=8

inherit font

DESCRIPTION="Nerd Fonts patched version of Cascadia Mono font"
HOMEPAGE="https://github.com/mrivnak/CascadiaMono-Nerd-Font"
SRC_URI="https://github.com/mrivnak/CascadiaMono-Nerd-Font/archive/refs/tags/${PV}.tar.gz"

SLOT=0
LICENSE="OFL-1.1"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv"

FONT_SUFFIX="ttf"

S="${WORKDIR}/CascadiaMono-Nerd-Font-${PV}"

src_prepare() {
    rm ./*Windows\ Compatible.ttf
    eapply_user
}