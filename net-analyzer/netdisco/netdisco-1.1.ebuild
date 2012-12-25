# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

WEBAPP_MANUAL_SLOT="yes"
inherit webapp eutils
DESCRIPTION="An open source web-based network management tool"
HOMEPAGE="http://www.netdisco.org/"
SRC_URI="mirror://sourceforge/${PN}/${PN}/1.1/${P}_with_mibs.tar.gz"

LICENSE="netdisco"
KEYWORDS="~amd64"
SLOT="0"
IUSE="graphviz ldap netbios"

DEPEND="
	dev-db/postgresql-server
	dev-lang/perl
	dev-perl/Apache-DBI
	dev-perl/Apache-Session
	dev-perl/DBD-Multiplex
	dev-perl/DBD-Pg
	dev-perl/DBI
	dev-perl/DBI-Shell
	dev-perl/HTML-Mason
	dev-perl/HTML-Parser
	dev-perl/Mason
	dev-perl/MasonX-Request-WithApacheSession
	dev-perl/Net-Daemon
	dev-perl/Net-SNMP
	dev-perl/Parallel-ForkManager
	dev-perl/PlRPC
	dev-perl/SNMP-Info
	www-apache/mod_perl
	www-apache/libapreq2[perl]
	www-servers/apache
	virtual/perl-Compress-Raw-Zlib
	virtual/perl-DB_File
	virtual/perl-Digest-MD5
	virtual/perl-Storable
	graphviz? ( media-gfx/graphviz dev-perl/Graph dev-perl/GraphViz )
	ldap? ( dev-perl/perl-ldap dev-perl/Net-SSLeay dev-perl/IO-Socket-SSL )
	netbios? ( dev-perl/Net-NBName )
"
RDEPEND="${DEPEND}
	virtual/cron
"

src_prepare() {
	sed -i netdisco -e "s:/usr/local/netdisco:${MY_HTDOCSDIR}:g"
	sed -i netdisco.conf -e "s:/usr/local/netdisco:${MY_HTDOCSDIR}:g"
	sed -i netdisco.crontab -e "s:/usr/local/netdisco:${MY_HTDOCSDIR}:g"
	sed -i netdisco_apache.conf -e "s:/usr/local/netdisco:${MY_HTDOCSDIR}:g" \
		-e "s:libexec/apache2/:modules/:"
	sed -i netdisco_apache_dir.conf -e "s:/usr/local/netdisco:${MY_HTDOCSDIR}:g"
	sed -i netdisco.pm -e "s:/usr/local/netdisco:${MY_HTDOCSDIR}:g"
	sed -i sql/pg -e "s:/usr/local/netdisco:${MY_HTDOCSDIR}:g"
	sed -i bin/netdisco_daemon -e "s:/usr/local/netdisco:${MY_HTDOCSDIR}:g"
}

src_compile() {
	emake doc
}

src_install() {
	webapp_src_preinst
	insinto /etc/apache2/modules.d/
	doins netdisco_apache.conf
	insinto /etc/apache2/vhosts.d/
	doins netdisco_apache_dir.conf
	insinto /etc/cron.d/
	doins netdisco.crontab
	dodoc README README-API-BACKEND README-API-SHARED UPGRADE
	dohtml doc/README.html
	rm -r netdisco_apache.conf netdisco_apache_dir.conf netdisco.crontab \
		bin/debian_install.sh bin/install/ README* UPGRADE doc/
	insinto "${MY_HTDOCSDIR}"
	chmod +x netdisco bin/*
	chown -R . netdisco:apache
	doins -r .
	webapp_postinst_txt en "${FILESDIR}/postinstall-en.txt"
	webapp_src_install
}
