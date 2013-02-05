define google_chrome::installation(
  $source      = undef,
  $destination = 'C:\packages'
) {

  if $source {
    $location = $source
  } else {
    $location = "puppet:///modules/${module_name}/GoogleChromeStandaloneEnterprise.msi"
  }

  $on_disk = "${destination}\\google_chrome.msi"

  file { $on_disk:
    ensure => present,
    source => $location,
  }

  package { 'Google Chrome':
    ensure          => installed,
    install_options => [ '/q', '/norestart' ],
    source          => $on_disk,
  }
}
