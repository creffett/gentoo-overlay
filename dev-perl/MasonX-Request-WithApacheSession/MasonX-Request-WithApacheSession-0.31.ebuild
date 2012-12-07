# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR="BLHOTSKY"
inherit perl-module

DESCRIPTION="Add a session to the Mason Request object"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-perl/Apache-Session-Wrapper
	dev-perl/HTML-Mason
"
DEPEND="${RDEPEND}
	virtual/perl-Module-Build
"

SRC_TEST="do"
