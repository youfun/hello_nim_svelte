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

template corsResp(code, message: untyped): untyped =
  mixin resp
  resp code, {"Access-Control-Allow-Origin": "*"}, message

router assets:
  get "/build/bundle.js":
    corsResp Http200, bundleJs

  get "/build/bundle.css":
    corsResp Http200, bundleCss

  get "/global.css":
    corsResp Http200, globalCss

routes:
  extend assets, ""

  get "/":
    resp """
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Nim and Svelte</title>

  <link rel='stylesheet' href='/global.css'>
  <link rel='stylesheet' href='/build/bundle.css'>

  <script defer src='/build/bundle.js'></script>
</head>
<body>
</body>
</html>
"""

runForever()
