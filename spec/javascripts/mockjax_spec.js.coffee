#= require jquery.mockjax

describe "Mockjax", ->
    beforeEach ->
        $.mockjax
            url: '/restful/fortune',
#            responseTime: 750,
            responseText:
                status: 'success',
                fortune: 'Are you a turtle?'

# jasmine Asynchronous Support: http://jasmine.github.io/2.0/introduction.html
# The syntax has changed for Jasmine 2.0.
# Jasmine also has support for running specs that require testing asynchronous operations.
# Calls to beforeEach, it, and afterEach can take an optional single argument that should be
# called when the async work is complete.

# This spec will not complete until its done is called.
    it "mocks your REST Service", (done) ->
      result = { the_status: null, the_fortune: null}
      $.getJSON '/restful/fortune', (response) ->
        expect(response.status).toEqual('success')
        expect(response.fortune).toEqual('Are you a turtle?')
        done()

