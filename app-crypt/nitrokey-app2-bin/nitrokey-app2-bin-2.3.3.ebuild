# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Cross platform personalization tool for the Nitrokey"
HOMEPAGE="https://github.com/Nitrokey/nitrokey-app2"
SRC_URI="https://github.com/Nitrokey/nitrokey-app2/releases/download/v2.3.3/nitrokey-app-v2.3.3-x64-linux-binary"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

src_install() {
	newbin ${S}/../distdir/nitrokey-app-v2.3.3-x64-linux-binary nitrokey-app2
}
