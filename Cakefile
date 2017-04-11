use 'sake-bundle'
use 'sake-outdated'
use 'sake-version'
use 'sake-test'

try
  use require './'
catch err

task 'clean', 'clean project', ->
  exec 'rm -rf lib'

task 'build', 'build project', ->
  bundle.write
    entry: 'src/index.coffee'
