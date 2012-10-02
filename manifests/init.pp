class zsh {
  package { 'zsh':
    ensure   => latest,
    provider => 'homebrew'
  }

  file_line { 'add zsh to /etc/shells':
    path    => '/etc/shells',
    line    => '/opt/github/homebrew/bin/zsh',
    require => Package['zsh'],
  }
}
