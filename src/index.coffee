import exec from 'executive'

module.exports = (opts = {}) ->
  opts.deploy ?= {}
  opts.git    ?= true
  opts.npm    ?= true

  task 'publish', 'publish project', ->
    if opts.npm
      # npm publish should happen first. Users may have prepublish scripts
      # which might generate compiled output. We don't currently commit these
      # changes, but we might later on.
      yield exec 'npm publish'

    cmds = [
      'git push'
      'git push --tags'
    ]

    if opts.git
      cmds.push 'git push'
      cmds.push 'git push --tags'

    {force, remote, refspec} = opts.deploy
    if remote? and refspec?
      cmds.push "git push #{if force then '-f' else ''} #{remote} #{refspec}"

    yield exec.parallel cmds
