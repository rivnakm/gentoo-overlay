# Copyright 2024 Mike Rivnak

EAPI=8

DESCRIPTION="Hyprshot is an utility to easily take screenshot in Hyprland using your mouse"
HOMEPAGE="https://github.com/Gustash/Hyprshot"
SRC_URI="https://github.com/Gustash/Hyprshot/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
    gui-apps/slurp
	gui-apps/grim
	gui-apps/wl-clipboard
"

src_unpack() {
    if [[ -n ${A} ]]; then
        unpack ${A}
		mv Hyprshot-${PV} hyprshot-${PV}
    fi
}

src_install() {
	mkdir -p ${D}/usr/bin
	cp hyprshot ${D}/usr/bin
}

