import asyncdispatch
import jester
import json
import os
import sequtils
import strutils

import ./views/static_assets

let settings = newSettings()
if existsEnv("PORT"):
  settings.port = Port(parseInt(getEnv("PORT")))

router assets:
  template corsResp(code, message: untyped): untyped =
    mixin resp
    resp code, {"Access-Control-Allow-Origin": "*"}, message

  get "/build/bundle.js":
    corsResp Http200, bundleJs

  get "/build/bundle.css":
    corsResp Http200, bundleCss

  get "/global.css":
    corsResp Http200, globalCss

router entrypoint:
  get "/":
    resp indexHtml

routes:
  extend assets, ""
  extend entrypoint, ""

runForever()
