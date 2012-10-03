# Public: Install zsh into Homebrew and add to /etc/shells.
#
# Examples
#
#   include zsh
class zsh {
  package { 'zsh': }

  file_line { 'add zsh to /etc/shells':
    path    => '/etc/shells',
    line    => "${boxen::config::homebrewdir}/bin/zsh",
    require => Package['zsh'],
  }
}
