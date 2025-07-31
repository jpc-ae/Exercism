//
// This is only a SKELETON file for the 'Matching Brackets' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const isPaired = (text) => {
  const pairs = new Map([
    ['[', ']'],
    ['(', ')'],
    ['{', '}']
  ])
  
  let result = true
  
  const bookends = Array.from(text.match(/[[({})\]]/g) || [])
  if (!bookends.length) return true

  // push and pop through nested pairs, breaking if any don't match and checking danglers
  const nest = []
  console.log(bookends)
  for (const bookend of bookends) {
    console.log(bookend)
    if (pairs.has(bookend)) {
      nest.push(bookend)
    } else if (pairs.get(nest.pop()) != bookend) {
      result = false
      break
    }
  }
  if (nest.length) result = false

  return result
}
