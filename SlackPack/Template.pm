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
# This script manages site templates
#
# $Id: Template.pm,v 1.3 2006/09/19 18:17:27 gsotirov Exp $
#

package SlackPack::Template;

use strict;
use File::Basename;
use SlackPack;
use SlackPack::Package;
use SlackPack::Category;

use base qw/Template/;

use constant SLACKPACK_PATH => dirname(dirname($INC{'SlackPack/Template.pm'}));

my $pack = new SlackPack::Package;

sub getTemplateIncludePath {
  return [SLACKPACK_PATH."/template/"];
}

sub create {
  my $class = shift;

  return $class->new({
    INCLUDE_PATH => [\&getTemplateIncludePath],
    PRE_CHOMP => 1,
    TRIM => 1});
}

sub process {
  my $class = shift;
  my ($file, $vars) = @_;
  ($vars->{'slackpack'}{'packs'}{'count'},
   $vars->{'slackpack'}{'packs'}{'size'},
   $vars->{'slackpack'}{'packs'}{'sizeB'}) = $pack->get_totals;
  $vars->{'slackpack'}{'categories'} = SlackPack::Category->get_all;

  return $class->SUPER::process($file, $vars);
}

1;

