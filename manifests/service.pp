class jenkins::service {

  service {
    'jenkins':
      ensure      => running,
      enable      => true,
      require     => Class['Jenkins::Config'];
  }
}