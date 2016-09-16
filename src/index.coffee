module.exports = (opts = {}) ->
  opts.gitPush     ?= true
  opts.gitPushTags ?= true
  opts.npmPublish  ?= true

  task 'publish', 'publish project', ->
    cmds = []

    if opts.gitPush
      cmds.push 'git push'

    if opts.gitPushTags
      cmds.push 'git push --tags'

    if opts.npmPublish
      cmds.push 'npm publish'

    exec.parallel cmds
