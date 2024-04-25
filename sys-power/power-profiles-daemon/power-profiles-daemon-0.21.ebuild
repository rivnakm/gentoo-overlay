# Copyright 2023-2024 Mike Rivnak

EAPI=8

inherit meson systemd

DESCRIPTION="Makes power profiles handling available over D-Bus."
HOMEPAGE="https://gitlab.freedesktop.org/upower/power-profiles-daemon"
SRC_URI="https://gitlab.freedesktop.org/upower/${PN}/-/archive/${PV}/${PN}-${PV}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
IUSE="doc"

KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~riscv ~x86"

BDEPEND="
    doc? ( dev-python/argparse-manpage )
"

DEPEND="
    >=dev-libs/libgudev-234
    dev-python/python-dbusmock
    dev-util/umockdev
    >=sys-auth/polkit-0.114
    sys-power/upower
"

src_configure() {
    local emesonargs=(
        $(meson_use doc gtk_doc)
    )
    meson_src_configure
}

src_install() {
    meson_src_install
    systemd_enable_service multi-user.target ${PN}.service
}

pkg_postinst() {
    ewarn "Don't forget to enable \"${PN}\" service, by runnning:"
    ewarn "systemctl daemon-reload && systemctl enable --now ${PN}"
}
