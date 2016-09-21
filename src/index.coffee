module.exports = (opts = {}) ->
  opts.deploy ?= {}
  opts.git    ?= true
  opts.npm    ?= true

  task 'publish', 'publish project', ->
    cmds = []

    if opts.git
      cmds.push 'git push'
      cmds.push 'git push --tags'

    {force, remote, refspec} = opts.deploy
    if remote? and refspec?
      cmds.push "git push #{if force then '-f' else ''} #{remote} #{refspec}"

    if opts.npm
      cmds.push 'npm publish'

    exec.parallel cmds
