# Copyright 2024 Mike Rivnak

EAPI=8

MY_PN="tailwindcss"

DESCRIPTION="A utility-first CSS framework for rapid UI development."
HOMEPAGE="https://tailwindcss.com"
LICENSE="MIT"

SRC_URI="
	amd64? ( https://github.com/tailwindlabs/${MY_PN}/releases/download/v${PV}/${MY_PN}-linux-x64 -> ${MY_PN}-amd64 )
	arm? ( https://github.com/tailwindlabs/${MY_PN}/releases/download/v${PV}/${MY_PN}-linux-armv7 -> ${MY_PN}-arm )
	arm64? ( https://github.com/tailwindlabs/${MY_PN}/releases/download/v${PV}/${MY_PN}-linux-arm64 -> ${MY_PN}-arm64 )
"

SLOT=0
KEYWORDS="~amd64 ~arm ~arm64"

QA_PREBUILT="
	usr/bin/tailwindcss
"

S=${WORKDIR}

src_unpack() {
	cp -L ${DISTDIR}/tailwindcss-${ARCH} ${WORKDIR}/tailwindcss || die
}

src_install() {
	exeinto /usr/bin
	doexe tailwindcss
}

