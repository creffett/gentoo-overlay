# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR="YVES"
inherit perl-module

DESCRIPTION="A simple wrapper around Apache::Session"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-perl/Apache-Session
	dev-perl/Class-Container
	dev-perl/Exception-Class
	dev-perl/Params-Validate
	virtual/perl-Module-Build
	virtual/perl-File-Spec
	virtual/perl-File-Temp
	virtual/perl-Module-Build
	virtual/perl-Scalar-List-Utils
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
