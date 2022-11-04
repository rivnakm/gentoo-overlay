# Copyright 2022 Michael Rivnak <rivnakm1@gmail.com>

EAPI=8

DESCRIPTION="GNU COBOL"
HOMEPAGE="https://www.gnu.org/software/gnucobol/"
LICENSE="GPL"

SRC_URI="https://ftp.gnu.org/gnu/gnucobol/${PN}-${PV}.tar.xz"

SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""
 
DEPEND="sys-libs/db"
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/gcc"

S="${WORKDIR}/${PN}-${PV}"

src_configure() {
    econf
}

src_compile() {
    emake
}

src_install() {
	emake DESTDIR="${D}" install
}