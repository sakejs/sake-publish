module.exports = (opts = {}) ->
  opts.git ?= true
  opts.npm ?= true

  task 'publish', 'publish project', ->
    cmds = []

    if opts.git
      cmds.push 'git push'
      cmds.push 'git push --tags'

    if opts.npm
      cmds.push 'npm publish'

    exec.parallel cmds
