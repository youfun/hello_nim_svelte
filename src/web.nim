import asyncdispatch
import jester
import json
import os
import sequtils
import strutils

# task assets, "Generate packaged assets":
#   exec "echo src/views/assets_file.nim | xargs -t -I{} nimassets --dir=public --output={}"

routes:
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
