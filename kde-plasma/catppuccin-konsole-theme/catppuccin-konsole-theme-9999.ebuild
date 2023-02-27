# Copyright 2023 Mike Rivnak

EAPI=8

inherit git-r3

DESCRIPTION="Nerd Fonts patched version of Cascadia Mono font"
HOMEPAGE="https://github.com/catppuccin/konsole"
EGIT_REPO_URI="https://github.com/catppuccin/konsole.git"
EGIT_REPO_BRANCH="main"

SLOT=0
LICENSE="MIT"

src_install() {
    insinto /usr/share/konsole/
    doins *.colorscheme
}