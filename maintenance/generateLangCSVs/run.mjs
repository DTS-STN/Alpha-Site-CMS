#!/usr/bin/env zx
import 'zx/globals'

const enFilePath = '../../src/admin/extensions/translations/en.json'
const frFilePath = '../../src/admin/extensions/translations/fr.json'

export default async () => {
  const en = await fs.readFile(enFilePath)
  console.log(JSON.parse(en))
}
