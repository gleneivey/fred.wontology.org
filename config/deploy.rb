# WontoMedia - a wontology web application
# Copyright (C) 2011 - Glen E. Ivey
#    www.wontology.com
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License version
# 3 as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program in the file COPYING and/or LICENSE.  If not,
# see <http://www.gnu.org/licenses/>.


  #### NOTE: this deployment configuration is intended to deploy an
  ####   instance of WontoMedia customized with the assets from its
  ####   'default-custom' directory.  It is targeted at deploying to
  ####   staging.wontology.org for WontoMedia testing and to be an
  ####   example of deploying a WontoMedia-powered web site by
  ####   incorporating it into the web site's repository as a git
  ####   submodule.  For an example of WontoMedia being incorporated
  ####   into a site as a gem, see:
  ####       https://github.com/gleneivey/wontology.org


set :application, "staging.wontology.org"
set :repository,  "git://github.com/gleneivey/staging.wontology.org.git"

wontomedia = File.join File.dirname(__FILE__), '..', 'vendor', 'wontomedia'
load File.join( wontomedia, 'config', 'deploy_wontomedia.rb' )
load File.join( wontomedia, 'config', 'deploy_on_a2hosting.rb' )
require 'bundler/capistrano'

role :app, 'wontology.org'
role :web, 'wontology.org', :deploy => false
role :db,  'wontology.org', :primary => true


set :app_to_customize,   File.join( release_path, 'vendor', 'wontomedia' )
set :app_to_run,         File.join( current_path, 'vendor', 'wontomedia' )
set :app_customization, [
      File.join( app_to_customize, 'default-custom' ),
      File.join( app_to_customize, 'customizations' )
  ].join(':')
set :a2_port,            12045
