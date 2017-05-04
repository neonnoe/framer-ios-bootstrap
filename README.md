# My starting point to develop an iOS prototype in Framer

This project is a stating point to develop a modular and extendible prototype in framer.

You can use npm to install node packages.

### Installation

``npm install``


### How-to use

This project uses babel to transpile ES6 code into useble JS code for framer. If you make changes in any JS file, you hate to run a grunt task to transpile and copy the JS files. Run grunt with:

``grunt``

It will copy transpiled JS files into

``modules/dist``

From there they can be used in framer modules.