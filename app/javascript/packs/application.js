import '../css/application.css'

import 'src/stylesheets/application'
const images = require.context('../images', true)

// makes jQuery available inside views folder
global.$ = require("jquery")

require("jquery")

import Turbolinks from 'turbolinks';
Turbolinks.start();
