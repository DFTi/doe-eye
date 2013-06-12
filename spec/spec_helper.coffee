process.env.NODE_ENV = 'test'

global.http = require 'http'
global.app = require('../app')

global.assert = require('assert')
global.Browser = require('zombie')

global.util = require 'util'

global.log = ->
	console.log util.inspect arguments