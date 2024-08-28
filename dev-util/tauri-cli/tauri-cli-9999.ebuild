# Copyright 2024 Mike Rivnak

EAPI=8

inherit cargo git-r3

EGIT_REPO_URI="https://github.com/tauri-apps/tauri"
EGIT_REPO_BRANCH="dev"

DESCRIPTION="Command line interface for building Tauri apps"
HOMEPAGE="https://tauri.app"
LICENSE="Apache-2.0 MIT"

SLOT="0"

BDEPEND="
	dev-build/cmake
	virtual/rust
"

S=${WORKDIR}/${P}/packages/cli

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

