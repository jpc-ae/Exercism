export const isPaired = (text) => {
  // remove non-bookend characters
  text = text.replaceAll(/[^[\]{}()]/g, '')

  // keep removing matching pairs until there are none left
  let len
  do {
    len = text.length
    text = text.replaceAll(/\[\]|\{\}|\(\)/g, '')
  } while (text.length < len)

  return !text.length
}
