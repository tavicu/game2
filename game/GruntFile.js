module.exports = function(grunt) {
	grunt.initConfig({
		browserify: {
			dist: {
				files: {
					'assets/app.js' : [
						'node_modules/jquery/dist/jquery.min.js', 
						'src/js/app.js'
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
					'assets/app.css': ['src/scss/app.scss']      
				}
			}
		},

		watch: {
			scripts: {
				files: ['src/js/**/*.js'],
				tasks: ['browserify'],
			},
			css: {
				files: ['src/scss/**/*.scss'],
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
