import asyncdispatch
import jester
import json
import os
import sequtils
import strutils

import ./router_web

let settings = newSettings()
if existsEnv("PORT"):
  settings.port = Port(parseInt(getEnv("PORT")))

router api:
  get "/":
    resp Http200, "API endpoints here"

routes:
  extend web, ""
  extend api, "/api"

runForever()
