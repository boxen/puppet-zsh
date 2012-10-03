class zsh {
  package { 'zsh': }

  file_line { 'add zsh to /etc/shells':
    path    => '/etc/shells',
    line    => '/opt/github/homebrew/bin/zsh',
    require => Package['zsh'],
  }
}
