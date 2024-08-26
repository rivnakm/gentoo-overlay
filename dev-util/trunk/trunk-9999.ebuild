# Copyright 2024 Mike Rivnak

EAPI=8

inherit cargo git-r3

EGIT_REPO_URI="https://github.com/trunk-rs/trunk"

DESCRIPTION="Build, bundle & ship your Rust WASM application to the web."
HOMEPAGE="https://trunkrs.dev"
LICENSE="Apache-2.0 MIT"

SLOT="0"

BDEPEND="
	dev-build/cmake
	virtual/rust
"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

