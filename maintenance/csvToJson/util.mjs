export const buildRows = (enJson, frJson) => {
  const enKeys = Object.keys(enJson)
  const frKeys = Object.keys(frJson)
  const allUniqueKeys = new Set(enKeys.concat(frKeys))

  const finalArr = []

  allUniqueKeys.forEach((keyName) => {
    const row = []
    row.push(keyName)
    row.push(enJson.hasOwnProperty(keyName) ? enJson[keyName] : '')
    row.push(frJson.hasOwnProperty(keyName) ? frJson[keyName] : '')

    finalArr.push(row)
  })

  return finalArr
}
