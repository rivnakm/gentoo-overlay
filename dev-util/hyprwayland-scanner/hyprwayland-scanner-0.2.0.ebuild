# Copyright 2024 Mike Rivnak

EAPI=8

inherit cmake

SRC_URI="https://github.com/hyprwm/hyprwayland-scanner/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

LICENSE="BSD-3"
SLOT="0"

DEPEND="
	dev-libs/pugixml
"

CMAKE_BUILD_TYPE=Release

