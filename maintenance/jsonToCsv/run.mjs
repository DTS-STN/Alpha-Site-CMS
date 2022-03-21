#!/usr/bin/env zx
import 'zx/globals'

import { stringify } from 'csv'
import { buildRows } from './util.mjs'

export default async ({
  build, base, sources
}) => {
  const en = JSON.parse(await fs.readFile(`${sources}/en.json`))
  const fr = JSON.parse(await fs.readFile(`${sources}/fr.json`))

  const mergedAndFlattened = buildRows(en, fr)
  const stream = fs.createWriteStream(`${build}/strapi-translations.csv`, { encoding: 'utf8' });

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
