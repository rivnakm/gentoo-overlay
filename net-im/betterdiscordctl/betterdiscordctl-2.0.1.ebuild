# Copyright 2023 Mike Rivnak

EAPI=8

DESCRIPTION="A utility for managing BetterDiscord on Linux."
HOMEPAGE="https://github.com/bb010g/betterdiscordctl"
LICENSE="MIT"

SRC_URI="https://github.com/bb010g/betterdiscordctl/archive/refs/tags/v${PV}.tar.gz"

SLOT=0
KEYWORDS="~amd64 ~arm ~arm64"
IUSE=""

DEPEND=""
RDEPEND="app-shells/bash"
BDEPEND=""

S="${WORKDIR}/${PN}-${PV}"

src_prepare() {
    sed -i 's/^DISABLE_SELF_UPGRADE=$/&yes/' betterdiscordctl

    eapply_user
}

src_install() {
    exeinto /usr/bin
    doexe betterdiscordctl
}
