module.exports = function(grunt) {
	grunt.initConfig({
		browserify: {
			dist: {
				files: {
					'web/dist/js/app.js' : [
						'node_modules/jquery/dist/jquery.min.js', 
						'web/js/app.js'
					]
				}
			},

			options: {
				'transform': [['babelify', {presets: ['es2015']}]]
			}
		},

		sass: {                              
			dist: {                           
				files: {                        
					'web/dist/css/app.css': ['web/scss/app.scss']      
				}
			}
		},

		watch: {
			scripts: {
				files: ['web/js/**/*.js'],
				tasks: ['browserify'],
			},
			css: {
				files: ['web/scss/**/*.scss'],
				tasks: ['sass'],
			},
		},
		
		pkg: grunt.file.readJSON('package.json')
	});

	grunt.loadNpmTasks('grunt-browserify');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-sass');
	grunt.loadNpmTasks('grunt-concat-css');
	
	grunt.registerTask('default', ['browserify', 'sass']);
}
