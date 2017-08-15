# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="RPC/PDU control and monitoring service for data center or compute cluster power management"
HOMEPAGE="https://github.com/chaos/powerman"
SRC_URI="https://github.com/chaos/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+httppower -snmppower -h8power +genders"

DEPEND="sys-devel/bison
	httppower? ( net-misc/curl )
	snmppower? ( net-analyzer/net-snmp )
	!app-accessibility/speech-tools"
RDEPEND=">=sys-libs/freeipmi-0.2.3"

src_configure() {
	# Powerman stores the pidfile under $localstatedir/run.
	# It's set to /var/lib in the release, but in gentoo pidfiles live under /var/run.
	econf \
		--localstatedir=/var \
		$(use_with httppower) \
		$(use_with snmppower) \
		$(use_with h8power) \
		$(use_with genders)
}

src_install() {
	emake DESTDIR="${D}" -j1 install
	dodoc AUTHORS ChangeLog DISCLAIMER NEWS TODO
}
