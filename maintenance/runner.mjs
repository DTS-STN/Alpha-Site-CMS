#!/usr/bin/env zx
import 'zx/globals'

const scriptToRun = process.argv[3]?.trim?.()

try {
  if (!scriptToRun) throw new Error(`Pass in a script name to run.`)
  const currentDir = __dirname
  const maintenanceBase = `maintenance`
  cd(maintenanceBase)
  cd(scriptToRun)
  const scriptBasePath = `${currentDir}/${maintenanceBase}/${scriptToRun}`
  console.log(`deleting and rebuilding build folder for ${scriptToRun}`)
  await $`rm -rf ./build`
  await $`mkdir ./build`

  console.log({
    base: scriptBasePath,
      build: `${scriptBasePath}/build`,
      sources: `${scriptBasePath}/sources`
  })
  const { default: script } = await import(`./${scriptToRun}/run.mjs`)
  console.log(`imported ${scriptToRun}/run.mjs`)

  console.log(`starting imported script`)

  console.log(await script({
      base: scriptBasePath,
      build: `${scriptBasePath}/build`,
      sources: `${scriptBasePath}/sources`
    }))
  console.log(`script finished running`)

  cd('../..')
} catch (e) {
  console.log('~~~')
  console.log("error running the script! details:")
  console.log(e)
  // throw e
}
