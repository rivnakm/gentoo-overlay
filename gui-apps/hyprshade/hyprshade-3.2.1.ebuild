# Copyright 2024 Mike Rivnak

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="Hyprland shader configuration tool"
HOMEPAGE="https://github.com/loqusion/${PN}"
SRC_URI="https://github.com/loqusion/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest

