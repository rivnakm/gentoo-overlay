# Copyright 2023 Mike Rivnak

EAPI=8

inherit desktop pax-utils xdg

DESCRIPTION="Visual Studio Code (vscode): Editor for building and debugging modern web and cloud applications (official binary version)"
HOMEPAGE="https://code.visualstudio.com"
LICENSE="MS-vscode-EULA"

SRC_URI="
    amd64? ( https://update.code.visualstudio.com/${PV}/linux-x64/stable -> ${P}-linux-x64.tar.gz )
    arm? ( https://update.code.visualstudio.com/${PV}/linux-armhf/stable -> ${P}-linux-armhf.tar.gz )
    arm64? ( https://update.code.visualstudio.com/${PV}/linux-arm64/stable -> ${P}-linux-arm64.tar.gz )
    "

SLOT=0
KEYWORDS="~amd64 ~arm ~arm64"
IUSE="global-menu gnome kde live-share qt5"

DEPEND=""
RDEPEND="
    x11-libs/gtk+
    x11-libs/libnotify
    app-crypt/libsecret
    x11-libs/libxkbfile
    x11-libs/libXScrnSaver
    sys-process/lsof
    dev-libs/nss
    x11-misc/shared-mime-info
    x11-misc/xdg-utils
    dev-libs/glib
    live-share? ( dev-libs/icu )
    global-menu? (
        dev-libs/libdbusmenu
        qt5? ( dev-libs/libdbusmenu-qt )
    )
    gnome? ( gnome-base/gnome-keyring )
    kde? ( kde-frameworks/kwallet )
    "
BDEPEND=""

QA_PREBUILT="opt/visual-studio-code/resources/app/node_modules.asar.unpacked/vscode-ripgrep/bin/rg
	opt/visual-studio-code/resources/app/node_modules.asar.unpacked/vsda/build/Release/vsda.node
	opt/visual-studio-code/resources/app/node_modules.asar.unpacked/vscode-sqlite3/build/Release/sqlite.node
	opt/visual-studio-code/resources/app/node_modules.asar.unpacked/node-pty/build/Release/pty.node
	opt/visual-studio-code/resources/app/node_modules.asar.unpacked/spdlog/build/Release/spdlog.node
	opt/visual-studio-code/resources/app/node_modules.asar.unpacked/native-is-elevated/build/Release/iselevated.node
	opt/visual-studio-code/resources/app/node_modules.asar.unpacked/native-keymap/build/Release/keymapping.node
	opt/visual-studio-code/resources/app/node_modules.asar.unpacked/native-watchdog/build/Release/watchdog.node
	opt/visual-studio-code/resources/app/extensions/node_modules/esbuild/bin/esbuild
	opt/visual-studio-code/code
	opt/visual-studio-code/libffmpeg.so
	opt/visual-studio-code/libGLESv2.so
	opt/visual-studio-code/libEGL.so
	opt/visual-studio-code/libvk_swiftshader.so
	opt/visual-studio-code/swiftshader/libGLESv2.so
	opt/visual-studio-code/swiftshader/libEGL.so"

pkg_setup() {
	use amd64 && S="${WORKDIR}/VSCode-linux-x64"
	use arm && S="${WORKDIR}/VSCode-linux-armhf"
	use arm64 && S="${WORKDIR}/VSCode-linux-arm64"
}

src_install() {
	newicon resources/app/resources/linux/code.png ${PN}.png
	newicon -s 512 resources/app/resources/linux/code.png ${PN}.png
	domenu "${FILESDIR}"/{code,code-url-handler}.desktop

	insinto /opt/${PN}
	doins -r .
	fperms +x /opt/${PN}/{code,bin/code} \
		/opt/${PN}/chrome_crashpad_handler
		/opt/${PN}/resources/app/extensions/git/dist/{askpass.sh,askpass-empty.sh} \
		/opt/${PN}/resources/app/node_modules.asar.unpacked/@vscode/ripgrep/bin/rg \
		/opt/${PN}/resources/app/node_modules.asar.unpacked/node-pty/build/Release/spawn-helper
	dodir /opt/bin
	dosym /opt/${PN}/bin/code /usr/bin/code

	insinto /usr/share/metainfo
	doins "${FILESDIR}"/code.appdata.xml

	pax-mark -m "${ED}"/opt/${PN}/code
}
