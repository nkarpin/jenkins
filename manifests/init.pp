class jenkins {

	include jenkins::install
	include jenkins::service
	include jenkins::config
}