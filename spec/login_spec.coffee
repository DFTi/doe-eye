require './spec_helper'

describe "Login", ->
	before ->
		@server = http.createServer(app).listen(5469)
		@browser = new Browser
			site: 'http://localhost:5469'
				
	beforeEach (done) ->
		@browser.visit('/', done)

	context 'invalid user', ->
		it "does not set the user", (done) ->	
			@browser
				.fill("username", 'jacob')
				.fill("password", 'fakepass')
				.pressButton "Log In", =>
					assert.equal @browser.window.user, undefined
				done()

	context 'valid user', ->
		it "stores private key in window.user", (done) ->	
			@browser
				.fill("username", 'superadmin@caps.local')
				.fill("password", 'superadmin@caps.local')
				.pressButton "Log In", =>
					assert.ok @browser.window.user.private_key?
				done()
