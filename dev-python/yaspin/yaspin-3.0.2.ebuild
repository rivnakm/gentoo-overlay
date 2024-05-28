# Copyright 2024 Mike Rivnak

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="A lightweight terminal spinner for Python"
HOMEPAGE="https://github.com/pavdmyt/${PN}"
SRC_URI="https://github.com/pavdmyt/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"

distutils_enable_tests pytest
