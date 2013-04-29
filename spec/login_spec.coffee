require './spec_helper'

describe "Login", ->
	before ->
		@server = http.createServer(app).listen(5469)
		@browser = new Browser
			site: 'http://localhost:5469'
				
	beforeEach (done) ->
		@browser.visit('/', done)

	it "logs in", (done) ->	
		@browser
			.fill("username", "jacob")
			.fill("password", "pass")
			.pressButton "Log In", =>
				assert.ok @browser.success
			done()
