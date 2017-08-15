# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Genders is a static cluster configuration database used for cluster configuration management"
HOMEPAGE="https://github.com/chaos/genders"
SRC_URI="https://github.com/chaos/${PN}/releases/downloads/${PN}-1-22-1/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-devel/bison"

# Makefile has race issues generating tab files in parallel
MAKEOPTS+=" -j1"

src_configure() {
	# disable all extensions, as only need minimal config for powerman
	econf --without-java-extensions --without-python-extensions --without-cplusplus-extensions
}

src_install() {
	emake DESTDIR="${D}" -j1 install
}
