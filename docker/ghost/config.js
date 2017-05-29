var path = require('path'),
    config;

config = {
    // ### Production
    // When running Ghost in the wild, use the production environment.
    // Configure your URL and mail settings here
    production: {
        url: 'http://mihail-mihaylov.com',
        mail: {
    		transport: 'SMTP',
    		options: {
        		service: 'Gmail',
        		auth: {
            		user: 'mihail.georgiev.mihaylov@gmail.com',
            		pass: 'yourpassword'
        		}
    		}
		},
        database: {
            client: 'mysql',
            connection: {
                host     : 'mysql',
                user     : 'GHOST_USER',
                password : 'GHOST_PASS',
                database : 'GHOST_DATABASE',
                charset  : 'utf8'
            }
        },
        server: {
            host: '0.0.0.0',
            port: '2368'
        },
	paths: {
	    contentPath: path.join(__dirname, '/')
	}
    }
};

module.exports = config;
