export const cost = (books) => {
  // precompile bundle prices in cents indexed to number of books
  const bundleCost = [
    0,
    800, // 1 * 800
    1520, // 2 * 800 * 0.95 (5% discount)
    2160, // 3 * 800 * 0.90 (10% discount)
    2560, // 4 * 800 * 0.80 (20% discount)
    3000  // 5 * 800 * 0.75 (25% discount)
  ]

  // get and sort by number of each book so that low-frequency items come last (aids in pricing comparisons)
  const coll = books.reduce((sets, book) => (sets[book - 1].push(book), sets), [[],[],[],[],[]])
  coll.sort((a, b) => b.length - a.length)
  const sortedBooks = coll.flat()

  const bundles = []
  for (const book of sortedBooks) {
    // check for started bundles that don't include this book
    const bundleSlots = bundles.reduce((acc, bundle, i) => {
      if(!bundle.includes(book)) acc.push(i)
      return acc
    }, [])

    // create or add to a bundle as appropriate
    if (!bundleSlots.length) {
      bundles[bundles.length] = [book]
    } else if (bundleSlots.length == 1) {
      bundles[bundleSlots[0]].push(book)
    } else {
      // calculate totals to see which bundle it would be cheaper to add this book to
      const totals = bundleSlots.map((slot) => bundleSlots.reduce((total, value) => {
        const count = bundles[value].length + (value == slot ? 1 : 0)
        return total + bundleCost[count]
      }, 0))
      const cheapest = totals.reduce((iMin, value, i, a) => (value < a[iMin] ? i : iMin), 0)
      bundles[bundleSlots[cheapest]].push(book)
    }
  }

  // add up the bundle prices
  return bundles.reduce((acc, bundle) => acc + bundleCost[bundle.length], 0)
};
