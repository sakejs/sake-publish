exec = require 'executive'

describe 'sake-publish', ->
  it 'should add tasks', ->
    {stdout} = yield exec 'sake', cwd: __dirname
    stdout.should.contain 'publish'
