#!/usr/bin/env zx
import 'zx/globals'
const mkdirp = require('mkdirp')
const rimraf = require('rimraf')

const scriptToRun = process.argv[3]?.trim?.()

try {
  if (!scriptToRun) throw new Error(`Pass in a script name to run.`)
  const currentDir = path.join(__dirname)
  const scriptBasePath = path.join(currentDir, scriptToRun)
  const paths = {
    base: scriptBasePath,
    build: path.join(scriptBasePath, 'build'),
    sources: path.join(scriptBasePath, 'sources')
  }
  console.log(`deleting and rebuilding build folder for ${scriptToRun}`)
  await $`rm -rf ${paths.build}`
  rimraf.sync(paths.build)
  mkdirp.sync(paths.build)
  const { default: script } = await import(path.join(scriptBasePath, 'run.mjs'))
  console.log(`starting imported script`)
  await script(paths)
  console.log(`script finished running`)
} catch (e) {
  console.log('~~~')
  console.log("error running the script! details:")
  console.log(e)
  // throw e
}
