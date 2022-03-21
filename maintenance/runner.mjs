#!/usr/bin/env zx
import 'zx/globals'

const scriptToRun = process.argv[3]?.trim?.()

try {
  if (!scriptToRun) throw new Error(`Pass in a script name to run.`)
  const currentDir = __dirname
  const scriptBasePath = `${currentDir}/${scriptToRun}`
  console.log(`deleting and rebuilding build folder for ${scriptToRun}`)
  await $`rm -rf ${scriptBasePath}/build`
  await $`mkdir ${scriptBasePath}/build`

  console.log(scriptBasePath)
  console.log({
    base: scriptBasePath,
    build: `${scriptBasePath}/build`,
    sources: `${scriptBasePath}/sources`
  })
  const { default: script } = await import(`${scriptBasePath}/run.mjs`)
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
