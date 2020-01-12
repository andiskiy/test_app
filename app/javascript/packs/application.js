// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import JQuery from 'jquery';
window.$ = window.JQuery = JQuery;

require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()
require('channels')

var requireTest = require.context('./components', true)
requireTest.keys().forEach(requireTest)

import './src/datatables.min'
import './app'


const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

import '../stylesheets/application.scss'
