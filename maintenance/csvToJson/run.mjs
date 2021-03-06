#!/usr/bin/env zx
import 'zx/globals'
import { parse } from 'csv'

export default async ({
  build, base, sources
}) => {
  const parser = fs
    .createReadStream(path.join(sources, 'strapi-translations.csv'))
    .pipe(parse());

  const langsObject = {
    en: {},
    fr: {}
  }

  let i = 0
  for await (const record of parser) {
    if (i !== 0) {
      langsObject.en[record[0]] = record[1]
      langsObject.fr[record[0]] = record[2]
    }
    if (i === 0) i++;
  }

  fs.writeFileSync(path.join(build, 'en.json'), JSON.stringify(langsObject.en, null, 2), 'utf8');
  fs.writeFileSync(path.join(build, 'fr.json'), JSON.stringify(langsObject.fr, null, 2), 'utf8');
}
