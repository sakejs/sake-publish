import exec from 'executive'

module.exports = (opts = {}) ->
  opts.deploy ?= {}
  opts.git    ?= true
  opts.npm    ?= true

  task 'publish', 'publish project', ->
    cmds = []

    if opts.npm
      cmds.push 'npm publish'

    if opts.git
      cmds = cmds.concat ['git push', 'git push --tags']

    {force, remote, refspec} = opts.deploy
    if remote? and refspec?
      cmds.push "git push #{if force then '-f' else ''} #{remote} #{refspec}"

    exec.parallel cmds
