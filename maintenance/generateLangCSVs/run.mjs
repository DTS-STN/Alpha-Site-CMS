#!/usr/bin/env zx
import 'zx/globals'

import { generate, stringify } from 'csv'

const enFilePath = '../../src/admin/extensions/translations/en.json'
const frFilePath = '../../src/admin/extensions/translations/fr.json'

export default async () => {
  const en = await fs.readFile(enFilePath)
  // csv.generate({
  //   length: 4
  // }, () => {

  // })
  var stream = fs.createWriteStream('./build/myFile.csv', { flags: 'a' });
  stringify([[2, 3], [44, 3]], {
    quoted: true,
    header: true,
    columns: {
      year: 'birthYear',
      phone: 'phone'
    }
  })
    .pipe(stream)

  // console.log(xx)
  // const fr = await fs.readFile(enFilePath)
  // console.log(JSON.parse(en))
}
