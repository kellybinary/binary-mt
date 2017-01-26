package Test2;
use strict;
use warnings;

our $VERSION = '1.302015';


1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Test2 - Framework for writing test tools that all work together.

=head1 DESCRIPTION

Test2 is a new testing framework produced by forking L<Test::Builder>,
completely refactoring it, adding many new features and capabilities.

=head1 GETTING STARTED

If you are interested in writing tests using new tools then you should look at
L<Test2::Suite>. L<Test::Suite> is a seperate cpan distribution that contains
many tools implemented on Test2.

If you are interested in writing new tools you should take a look at
L<Test2::API> first.

=head1 NAMESPACE LAYOUT

This describes the namespace layout for the Test2 ecosystem. Not all the
namespaces listed here are part of the Test2 distribution, some are implemented
in L<Test2::Suite>.

=head2 Test2::Tools::

This namespace is for sets of tools. Modules in this namespace should export
tools like C<ok()> and C<is()>. Most things written for Test2 should go here.
Modules in this namespace B<MUST NOT> export subs from other tools. See the
L</Test2::Bundle::> namespace if you want to do that.

=head2 Test2::Plugin::

This namespace is for plugins. Plugins are modules that change or enhance the
behavior of Test2. An example of a plugin is a module that sets the encoding to
utf8 globally. Another example is a module that causes a bail-out event after
the first test failure.

=head2 Test2::Bundle::

This namespace is for bundles of tools and plugins. Loading one of these may
load multiple tools and plugins. Modules in this namespace should not implement
tools directly. In general modules in this namespace should load tools and
plugins, then re-export things into the consumers namespace.

=head2 Test2::Require::

This namespace is for modules that cause a test to be skipped when conditions
do not allow it to run. Examples would be modules that skip the test on older
perls, or when non-essential modules have not been installed.

=head2 Test2::Formatter::

Formatters live under this namespace. L<Test2::Formatter::TAP> is the only
formatter currently. It is acceptible for third party distributions to create
new formatters under this namespace.

=head2 Test2::Event::

Events live under this namespace. It is considered acceptible for third party
distributions to add new event types in this namespace.

=head2 Test2::Hub::

Hub subclasses (and some hub utility objects) live under this namespace. It is
perfectly reasonable for third party distributions to add new hub subclasses in
this namespace.

=head2 Test2::IPC::

The IPC subsystem lives in this namespace. There are not many good reasons to
add anything to this namespace, with exception of IPC drivers.

=head3 Test2::IPC::Driver::

IPC drivers live in this namespace. It is fine to create new IPC drivers and to
put them in this namespace.

=head2 Test2::Util::

This namespace is for general utilities used by testing tools. Please be
considerate when adding new modules to this namespace.

=head2 Test2::API::

This is for Test2 API and related packages.

=head2 Test2::

The Test2:: namespace is intended for extentions and frameworks. Tools,
Plugins, etc should not go directly into this namespace. However extentions
that are used to build tools and plugins may go here.

In short: If the module exports anything that should be run directly by a test
script it should probably NOT go directly into C<Test2::XXX>.

=head1 SEE ALSO

L<Test2::API> - Primary API functions.

L<Test2::API::Context> - Detailed documentation of the context object.

L<Test2::IPC> - The IPC system used for threading/fork support.

L<Test2::Formatter> - Formatters such as TAP live here.

L<Test2::Event> - Events live in this namespace.

L<Test2::Hub> - All events eventually funnel through a hub. Custom hubs are how
C<intercept()> and C<run_subtest()> are implemented.

=head1 SOURCE

The source code repository for Test2 can be found at
F<http://github.com/Test-More/test-more/>.

=head1 MAINTAINERS

=over 4

=item Chad Granum E<lt>exodist@cpan.orgE<gt>

=back

=head1 AUTHORS

=over 4

=item Chad Granum E<lt>exodist@cpan.orgE<gt>

=back

=head1 COPYRIGHT

Copyright 2016 Chad Granum E<lt>exodist@cpan.orgE<gt>.

This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

See F<http://dev.perl.org/licenses/>

=cut