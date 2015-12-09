module.exports = (opts = {}) ->
  task 'publish', 'publish project', (options) ->
    exec.parallel '''
    git push
    git push --tags
    npm publish
    '''
