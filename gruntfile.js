
module.exports = function(grunt) {

	require('load-grunt-tasks')(grunt);

	grunt.initConfig({
		babel: {
			options: {
				sourceMap: true,
				presets: ['es2015']
			},
			dist: {
				// files: {
				// 	'modules/dist/app.js': 'src/app.js'
				// }
				files: [{
					"expand": true,
					"cwd": "src/",
					"src": ["**/*.js"],
					"dest": "modules/dist/",
					"ext": ".js"
				}]
			}
		}
	});

	grunt.registerTask('default', ['babel']);
}