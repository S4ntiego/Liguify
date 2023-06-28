module.exports = delay = (timeToWait) =>
  new Promise((resolve) => setTimeout(resolve, timeToWait));
