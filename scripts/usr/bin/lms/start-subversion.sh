#!/bin/bash
# =========================================================================
# =========================================================================
#
#	subversion.sh
#	  Start subversion
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 0.0.1
# @copyright © 2018. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ewsdocker/alpine-subversion
# @subpackage subversion
#
# =========================================================================
#
#	Copyright © 2018. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/alpine-subversion.
#
#   ewsdocker/alpine-subversion is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/alpine-subversion is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/alpine-subversion.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# =========================================================================
# =========================================================================

declare status=0

# =========================================================================

. /usr/local/lib/lms-alpine/lmsconDisplay-0.0.1.sh
. /usr/local/lib/lms-alpine/lmsSetupSubversion-0.0.1.sh

# =========================================================================

lmsSetupSubversion "${SVN_REPO}" "${SVN_HTML}" "${SVN_USER}" "${SVN_PASS}"
status=$?

[[ ${status} -eq 0 ]] || 
 {
 	lmsconDisplay "Setup Apache-SVN has failed: ${status}"
 	exit ${status}
 }

httpd -D FOREGROUND

exit $?
