#!/usr/bin/env zx
import 'zx/globals'

export default async () => {
  const fileContents = fs.readFileSync('./sources/someinput.txt', 'utf8')
  const transformedContents = fileContents.trim().toUpperCase()
  fs.writeFileSync('./build/someoutput.txt', transformedContents, 'utf8');
}
