# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
ETYPE="sources"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="2"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"

inherit kernel-2
detect_version
detect_arch

DESCRIPTION="Full sources including patches for ASUS ROG laptops"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI}"
KEYWORDS="~amd64"

UNIPATCH_LIST="
	${FILESDIR}/01-rog-2024-mini-led.patch
	${FILESDIR}/02-vivobook-gpu-mux.patch
	${FILESDIR}/03-tuf-rgb.patch
	${FILESDIR}/04-post-sound-toggle.patch
	${FILESDIR}/05-store-min-default-ppt.patch
	${FILESDIR}/06-format-ppt-fns.patch
	${FILESDIR}/07-ally-mcu-powersave.patch
	${FILESDIR}/08-mcu-powersave.patch
	${FILESDIR}/09-cleanup-main-struct.patch
"
UNIPATCH_STRICTORDER="yes"

pkg_postinst() {
	kernel-2_pkg_postinst
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
