#!/usr/bin/perl
#
# SlackPack
# Copyright (C) 2006  Georgi D. Sotirov, gsotirov@sotirov-bg.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
# DESCRIPTION:
# The Perl modules used to do all the dirty work
#
# $Id: SlackPack.pm,v 1.5 2006/10/16 21:52:49 gsotirov Exp $
#

package SlackPack;

use SlackPack::DB;
use SlackPack::CGI;
use SlackPack::Template;

use constant AUTHOR       => 'Georgi D. Sotirov';
use constant AUTHOR_EMAIL => 'gdsotirov@dir.bg';
use constant AUTHOR_URL   => 'http://sotirov-bg.net/~gsotirov/';
use constant VERSION      => '0.1.0';
use constant LOCAL_ROOT   => '/var/ftp';

our $_cache = {};

sub cgi {
  cache()->{cgi} ||= new SlackPack::CGI;
  return cache()->{cgi};
}

sub dbh {
  cache()->{dbh} ||= SlackPack::DB::connect;
  return cache()->{dbh};
}

sub template {
  cache()->{template} ||= SlackPack::Template->create();
  return cache()->{template};
}

sub cache {
  return $_cache;
}

sub _cleanup {
  SlackPack::DB::disconnect(cache()->{dbh});
}

1;

