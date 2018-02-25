const results = require("./results.json");
const { table } = require("table");
const chalk = require("chalk");
const abResult = require("ab-result");

const data = [
  [
    "Query",
    "program",
    "Concurrency",
    // ----
    "requests sent",
    "requests complete",
    "requests/second avg",
    "latency min",
    "latency p50",
    "latency p90",
    "latency p99",
    "max RSS"
  ].map(str => chalk.bold(str))
];

function statsFromAbResult(result) {
  const parsed = abResult(result.stdout);
  const [, times] = result.stdout.split(/Percentage of the requests/);
  const [, p50] = times.match(/50%\s+([0-9]+)/);
  const [, p90] = times.match(/90%\s+([0-9]+)/);
  const [, p99] = times.match(/99%\s+([0-9]+)/);
  return [
    parsed.test.completeRequests + parsed.test.failedRequests,
    parsed.test.completeRequests,
    parsed.test.requestsPerSecond,
    parsed.time.total.min,
    p50,
    p90,
    p99,
    Math.max(...result.memorySamples.map(([ts, rss]) => rss))
  ]
}

function statsFromResult(result) {
  if (result.type === "ab") {
    return statsFromAbResult(result);
  } else {
    return [
      result.requests.sent,
      result.requests.total,
      result.requests.average,
      result.latency.average,
      result.latency.p50,
      result.latency.p90,
      result.latency.p99,
      Math.max(...result.memorySamples.map(([ts, rss]) => rss))
    ];
  }
}

for (const result of results) {
  const [bin, query, concurrency] = result.title.split(/ \/ (?:concurrency=)?/);
  data.push(
    [
      query,
      (bin.startsWith("postgraphile") ? chalk.green : chalk.red)(bin),
      concurrency,
      ...statsFromResult(result)
    ].map(String)
  );
}

console.log(table(data));
