exec = require 'executive'

describe 'cake-publish', ->
  it 'should add tasks', ->
    {stdout} = yield exec 'cake', cwd: __dirname
    stdout.should.contain 'publish'
