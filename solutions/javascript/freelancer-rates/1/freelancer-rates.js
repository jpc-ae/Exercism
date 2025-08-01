// @ts-check

/**
 * The day rate, given a rate per hour
 *
 * @param {number} ratePerHour
 * @returns {number} the rate per day
 */
export const dayRate = (ratePerHour) => ratePerHour * 8

/**
 * Calculates the number of days in a budget, rounded down
 *
 * @param {number} budget: the total budget
 * @param {number} ratePerHour: the rate per hour
 * @returns {number} the number of days
 */
export const daysInBudget = (budget, ratePerHour) => Math.floor(budget / dayRate(ratePerHour))

/**
 * Calculates the discounted rate for large projects, rounded up
 *
 * @param {number} ratePerHour
 * @param {number} numDays: number of days the project spans
 * @param {number} discount: for example 20% written as 0.2
 * @returns {number} the rounded up discounted rate
 */
export function priceWithMonthlyDiscount(ratePerHour, numDays, discount) {
  const rate = dayRate(ratePerHour)
  const daysPerMonth = 22
  const monthRate = rate * daysPerMonth * (1 - discount)
  const fullMonths = Math.floor(numDays / daysPerMonth)
  return Math.ceil((fullMonths * monthRate) + ((numDays % daysPerMonth) * rate))
}
