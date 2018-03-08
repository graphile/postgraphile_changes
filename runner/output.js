const results = require("./results.json");
const { table } = require("table");
const chalk = require("chalk");
const abResult = require("ab-result");
const Convert = require('ansi-to-html');
const fs = require('fs');

const convert = new Convert();

const a2h = str => convert.toHtml(str);
const tagify = tag => str => `<${tag}>${str}</${tag}>`;

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

const linkQuery = str => `<a href="./graphql/${str}">${str.replace(/\.graphql$/,'')}</a>`;

console.log(table(data));

const trimmedData = data.map(row => [...row.slice(0,3), ...row.slice(5)]);
const htmlParts = [];
htmlParts.push("<table>");

htmlParts.push("<thead><tr>");
const headers = trimmedData[0];
headers[2] = 'Conc'
headers[3] = 'req/s'
htmlParts.push(...(headers.map(a2h).map(tagify('th'))));
htmlParts.push("</tr></thead>");

htmlParts.push("<tbody>");
trimmedData.slice(1).forEach(row => {
  htmlParts.push("<tr><th>",linkQuery(row[0]),"</th>",...(row.slice(1).map(a2h).map(tagify('td'))), "</tr>");
});
htmlParts.push("</tbody>");

htmlParts.push("</table>");
const html = htmlParts.join("\n");
// Query                       │ program                          │ Concurrency │ requests sent │ requests complete │ requests/second avg │ latency min │ latency p50 │ latency p90 │ latency p99 │ max RSS
fs.writeFileSync(`${__dirname}/../RESULTS.md`, `\
# Results

These are the results of running the various GraphQL queries against a database running on a Mid-2011 iMac. You can reproduce this test by running \`node runner\`.

- Query: the GraphQL query that we execute
- Program: which version of PostGraphQL/PostGraphile are we using?
- Conc: concurrency - how many requests do we try and make the server process in parallel?
- req/s: average requests per second - the total number of requests divided by the total number of seconds
- Latency min: the fastest response time any of the queries gave
- Latency p50: the average response time queries gave (50th percentile - 50% of queries completed this fast or faster)
- Latency p90: 90% of queries completed within this duration
- Latency p99: 99% of queries completed within this duration
- Max RSS: the peak memory usage of the node process. ⚠️ This does not work with \`--cluster-workers\` because it only monitors the parent process. ⚠️ Do not trust this figure, it was not polled with sufficient resolution to be reliable.

---

${html}
`);
