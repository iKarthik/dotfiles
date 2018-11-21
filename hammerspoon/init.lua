--local windows = require 'windows'
local windowManagement = require 'windowManagement'
local plugins = require 'plugins'
local extras = require 'extras'
local lock = require 'lock'
local applications = require 'applications'
local inbox = require 'inbox'
local appWatchers = require 'appWatchers'
local windowManagement = require 'windowManagement'

--[ Defines ]-------------------------------------------------------------
hyper =  {"cmd","alt","ctrl"}	-- caps lock held down
shyper =  {"cmd","alt","ctrl","shift"}	-- caps lock held down, with shift
hs.window.animationDuration = 0


-- windowManagement.init(hyper)
plugins.init(hyper)
windowManagement.init(hyper, shyper)

lock.init(hyper)
applications.init(hyper)
inbox.init(hyper)
appWatchers.init()
extras.init()

