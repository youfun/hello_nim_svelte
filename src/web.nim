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
  # template corsResp(code, message: untyped): untyped =
  #   mixin resp
  #   resp code, {"Access-Control-Allow-Origin": "*"}, message

  get "/build/bundle.js":
    resp Http200, {"Content-Type": "text/javascript"}, bundleJs

  get "/build/bundle.js.map":
    resp Http200, {"Content-Type": "application/json"}, bundleJsMap

  get "/build/bundle.css":
    resp Http200, {"Content-Type": "text/css"}, bundleCss

  get "/build/bundle.css.map":
    resp Http200, {"Content-Type": "application/json"}, bundleCssMap

  get "/global.css":
    resp Http200, {"Content-Type": "text/css"}, globalCss

router entrypoint:
  get "/":
    resp indexHtml

routes:
  extend assets, ""
  extend entrypoint, ""

runForever()
