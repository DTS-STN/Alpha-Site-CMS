#!/usr/bin/env zx
import 'zx/globals'

export default async ({
  build,
  sources,
  base
}) => {
  const fileContents = fs.readFileSync(path.join(sources, 'someinput.txt'), 'utf8')
  const transformedContents = fileContents.trim().toUpperCase()
  fs.writeFileSync(path.join(build, 'someinput.txt'), transformedContents, 'utf8');
}
