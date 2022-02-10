#!/usr/bin/env zx
import 'zx/globals'

import { generate, stringify } from 'csv'
import { buildRows } from './util.mjs'

const enFilePath = './sources/en.json'
const frFilePath = './sources/fr.json'
const buildPath = './build'

export default async () => {
  const en = JSON.parse(await fs.readFile(enFilePath))
  const fr = JSON.parse(await fs.readFile(frFilePath))

  const mergedAndFlattened = buildRows(en, fr)
  const stream = fs.createWriteStream(`${buildPath}/strapi-translations.csv`, { flags: 'a' });

  stringify(mergedAndFlattened, {
    quoted: true,
    header: true,
    columns: {
      id: 'ID',
      en: 'EN',
      fr: 'FR'
    }
  })
    .pipe(stream)
}
