# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR="OLIVER"
inherit perl-module

DESCRIPTION="Object Oriented Perl5 Interface to Network devices and MIBs through SNMP"

LICENSE="netdisco"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	net-analyzer/net-snmp[perl]
	virtual/perl-Math-BigInt
	virtual/perl-Test-Simple
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
