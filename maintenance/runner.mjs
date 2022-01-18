#!/usr/bin/env zx
import 'zx/globals'

const scriptToRun = process.argv[3]?.trim?.()

try {
  if (!scriptToRun) throw new Error(`Pass in a script name to run.`)

  console.log(`switching working directory to ./maintenance/${scriptToRun}`)
  cd(`./maintenance`)
  cd(`./${scriptToRun}`)

  await $`pwd`

  console.log(`deleting and rebuilding build folder for ${scriptToRun}`)
  await $`rm -rf ./build`
  await $`mkdir ./build`

  const { default: script } = await import(`./${scriptToRun}/run.mjs`)
  console.log(`imported ${scriptToRun}/run.mjs`)

  console.log(`starting imported script`)
  console.log(await script())
  console.log(`script finished running`)

  cd('../..')
} catch (e) {
  console.log('~~~')
  console.log("error running the script! details:")
  console.log(e)
  // throw e
}
