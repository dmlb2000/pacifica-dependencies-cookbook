name 'pacifica-dependencies'
maintainer 'David Brown'
maintainer_email 'dmlb2000@gmail.com'
license 'Apache-2.0'
description 'Installs/Configures pacifica-dependencies'
long_description 'Installs/Configures pacifica-dependencies'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/pacifica/pacifica-dependencies/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/pacifica/pacifica-dependencies'

supports 'ubuntu', '>= 16.04'
supports 'centos', '>= 6.0'
supports 'redhat', '>= 6.0'
