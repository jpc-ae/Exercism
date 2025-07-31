export const isPaired = (text) => {
  // remove non-bookend characters
  text = text.replaceAll(/[^[\]{}()]/g, '')

  // quick check for odd lengths missing a pair
  if (text.length % 2 > 0) return false

  // keep removing matching pairs until there are none left
  let len
  do {
    len = text.length
    text = text.replaceAll(/\[\]|\{\}|\(\)/g, '')
  } while (text.length < len)

  return !text.length
}
