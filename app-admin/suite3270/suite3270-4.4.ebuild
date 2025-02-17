# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An IBM 3270 terminal emulator for the X Window System"
HOMEPAGE="https://x3270.miraheze.org/wiki/Main_Page"
SRC_URI="https://x3270.bgp.nu/download/04.04/suite3270-4.4ga4-src.tgz"

LICENSE="not sure yet"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="x11-libs/libxaw
	dev-tcltk/tcllib"
RDEPEND="${DEPEND}"
BDEPEND=""

