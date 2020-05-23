# Package

version       = "0.1.0"
author        = "Andrew Seward"
description   = "Trying out nim with svelte"
license       = "MIT"
srcDir        = "src"
bin           = @["web"]



# Dependencies

requires "nim >= 1.2.0"
requires "jester >= 0.4.3"
requires "nimassets >= 0.1.0"



# Tasks
task svelte, "Generate svelte bundle":
  exec "npm run build"

task assets, "Generate packaged assets":
  exec "mkdir -vp src/views && echo src/views/assets_file.nim | xargs -t -I{} nimassets --dir=public --output={}"

task watch_assets, "Watch assets in public/ and rebuild the nim assets file if changes occur":
  exec "find public -type f | entr nimble assets"

task watch_svelte, "Watch svelte files in src/ and rebuild assets in public/ if changes occur":
  exec "find src -type f -name '*.svelte' -or -name '*.js' | entr nimble svelte"

task watch_web, "Watch nim files in src/ and restart web if changes occur":
  exec "find src -type f -name '*.nim' | entr -r nimble run web"
