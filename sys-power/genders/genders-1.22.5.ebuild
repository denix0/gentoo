# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="genders library"
HOMEPAGE="https://github.com/chaos/genders"
SRC_URI="https://github.com/chaos/${PN}/releases/downloads/${PN}-1-22-1/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-devel/bison"

MAKEOPTS+=" -j1"

src_configure() {
	# Powerman stores the pidfile under $localstatedir/run.
	# It's set to /var/lib in the release, but in gentoo pidfiles live under /var/run.
	econf --without-java-extensions --without-python-extensions --without-cplusplus-extensions
}

src_install() {
	emake DESTDIR="${D}" -j1 install
#	rm -rf "${D}"/{etc/init.d/${PN},var/run}
#	doinitd "${FILESDIR}"/${PN}
#	dodoc AUTHORS ChangeLog DISCLAIMER NEWS TODO
}
