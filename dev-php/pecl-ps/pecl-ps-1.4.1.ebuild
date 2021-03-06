# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PHP_EXT_NAME="ps"
USE_PHP="php5-6 php7-0 php7-1 php7-2"

inherit php-ext-pecl-r3

# Only really build for >=7.0
USE_PHP="php7-0 php7-1 php7-2"

KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"

DESCRIPTION="PHP extension for creating PostScript files"
LICENSE="BSD"
SLOT="7"
IUSE="examples"

DEPEND="
	php_targets_php7-0? ( dev-libs/pslib )
	php_targets_php7-1? ( dev-libs/pslib )
	php_targets_php7-2? ( dev-libs/pslib )
"
RDEPEND="${DEPEND} php_targets_php5-6? ( dev-php/pecl-ps:0[php_targets_php5-6] )"
PHP_EXT_ECONF_ARGS=""

src_prepare() {
	if use php_targets_php7-0 || use php_targets_php7-1 || use php_targets_php7-2 ; then
		php-ext-source-r3_src_prepare
	else
		default_src_prepare
	fi
}

src_install() {
	if use php_targets_php7-0 || use php_targets_php7-1 || use php_targets_php7-2 ; then
		php-ext-pecl-r3_src_install
	fi
}
