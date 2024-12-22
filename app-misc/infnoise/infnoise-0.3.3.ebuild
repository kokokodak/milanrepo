# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="infinite noise TRNG program"
HOMEPAGE="https://github.com/leetronics/infnoise"
SRC_URI="https://github.com/leetronics/infnoise/archive/refs/tags/0.3.3.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-embedded/libftdi"
RDEPEND="${DEPEND}"
BDEPEND=""

IUSE="pic"
REQUIRED_USE="pic"

inherit udev

src_prepare() {
	eapply_user
	sed -i 's|PREFIX = $(DESTDIR)/usr/local|PREFIX=${DESTDIR}|' "${S}/software/Makefile.linux"
	sed -i '/^GIT_/d' "${S}/software/Makefile.linux"
}

src_compile() {
	local ftdi_cflags
	local ftdi_ldflags

	ftdi_cflags=$(pkg-config --cflags libftdi1)
	ftdi_ldflags=$(pkg-config --libs libftdi1)

	origCFLAGS="-fPIC -std=c99 -DLINUX -I Keccak -DGIT_VERSION=\\\"\\\" -DGIT_COMMIT=\\\"\\\" -DGIT_DATE=\\\"\\\""
	export DESTDIR="${D}"

	cd ${S}/software
	emake -f Makefile.linux DESTDIR="${D}" CFLAGS="${CFLAGS} ${origCFLAGS} ${ftdi_cflags}" LDFLAGS="${LDFLAGS} ${ftdi_ldflags}" -j$(nproc)
}

src_install() {
	newinitd "${FILESDIR}"/infnoise.initd infnoise

	cd ${S}/software
	export DESTDIR="${D}"
	emake -f Makefile.linux install DESTDIR="${D}"
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
