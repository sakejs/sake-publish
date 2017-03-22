module.exports = (opts = {}) ->
  opts.deploy ?= {}
  opts.git    ?= true
  opts.npm    ?= true

  task 'publish', 'publish project', ->
    if opts.npm
      # npm publish should happen first as users may have prepublish scripts that should run
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
