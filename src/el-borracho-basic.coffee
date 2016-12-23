require "source-map-support/register"
Redis    = require "ioredis"
errify   = require "errify"
Skeleton = require "nextorigin-express-skeleton"
Queue    = require "bull"
Borracho = require "el-borracho/router"
Stats    = require "el-borracho-stats/router"
root     = require "el-borracho-ui/asset-path"


class ElBorrachoBasic extends Skeleton
  logPrefix: "(El Borracho)"

  constructor: (@options = {}) ->
    @redis           or= @options.redis or Redis.createClient()
    @options.address or= "0.0.0.0"
    @options.api      ?= true
    @options.stats    ?= true
    @options.ui       ?= true

    if @options.ui
      @options.static = {root}

      unless process.env.NODE_ENV is "development"
        oneYear = 86400
        @options.static.options = maxAge: oneYear

    super options
    @debug "initializing basic"

  initStats: (callback) ->
    ideally = errify callback
    Worker  = require "el-borracho-stats/worker"
    Store   = require "el-borracho/lib/redis-model"
    store   = new Store @redis
    @stats  = {}

    await store.queueNames ideally defer names
    for name in names
      queue = new Queue name, redis: opts: createClient: => @redis
      stats = new Worker {queue}
      @stats[name] = stats

    callback()

  bindRoutes: ->
    @routeApi()   if @options.api
    @routeStats() if @options.stats

  routeApi: ->
    mount     = if @options.ui then "/jobs" else "/"
    @borracho = new Borracho {@server, @redis}
    @app.use mount, @borracho.router

  routeStats: ->
    @stats = new Stats {@server, @redis}
    @app.use "/stats", @stats.router

  listen: ->
    ideally = errify (err) -> throw err

    if @options.stats
      await @initStats ideally defer()
      stats.listen() for _, stats of @stats

    super

  close: ->
    await stats.stop defer() for _, stats of @stats when stats?
    super


module.exports = ElBorrachoBasic
