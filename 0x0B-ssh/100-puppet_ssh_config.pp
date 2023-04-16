# Setting up my client config file to ensure connection to server without server and use ~/.ssh/school as key

include stdlib

file {'Deny password authentication':
	ensure 				=> present,
	path				=> 'etc/ssh/ssh_config',
	line				=> '	passwordAuthentication no',
	match              	=> '^[#]+[\s]*(?i)IdentityFile[\s]+~/.ssh/id_rsa$',
	replace				=> true,
	append_on_no_match 	=> true
}

file {'Declare identity file':
	ensure				=> present,
	path				=> 'etc/ssh/ssh_config',
	line				=> '	IdentityFile ~/.ssh/school',
	match              	=> '^[#]+[\s]*(?i)PasswordAuthentication[\s]+(yes|no)$',
	replace				=> true,
	append_on_no_match 	=> true
}
