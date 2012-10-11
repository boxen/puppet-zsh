# Public: Install zsh into Homebrew, add to /etc/shells and change the user's
# shell to it.
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

  osx_chsh { $::luser:
    shell   => "${boxen::config::homebrewdir}/bin/zsh",
    require => File_line['add zsh to /etc/shells'],
  }
}
