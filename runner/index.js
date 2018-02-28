const { resolve } = require("path");
const { spawn, execFile, exec } = require("child_process");
const { readdirSync, readFileSync, writeFileSync, writeFile } = require("fs");
const rawAutocannon = require("autocannon");

const LOG_OUTPUT = false;

function autocannon(opts) {
  return new Promise((resolve, reject) => {
    const instance = rawAutocannon(opts, (err, result) => {
      if (err) {
        return reject(err);
      } else {
        return resolve(result);
      }
    });

    if (!LOG_OUTPUT) {
      //autocannon.track(instance);
    }
  });
}
autocannon.track = rawAutocannon.track;

function ab(opts) {
  /*
   * opts:
      url: "http://localhost:5000/graphql",
      method: "POST",
      body: JSON.stringify({
        query,
        variables
      }),
      headers: {
        "Content-Type": "application/json"
      },
      connections: 3,
      amount: 100,
      timeout: 200
  */
  return new Promise((resolve, reject) => {
    const postBodyFile = `${__dirname}/postbody`;
    writeFile(postBodyFile, opts.body, err => {
      if (err) {
        return reject(err);
      }
      const method = opts.method || "POST";
      const args = [
        "-n", opts.amount || 100,
        "-c", opts.connections || 1,
        "-s", opts.timeout || 30,
        "-T", "application/json",
        //"-m", method,
        ...(method === "POST" ? ["-p", postBodyFile] : null),
        opts.url
      ];

      exec(
        `ab '${args.join("' '")}'`,
        (err, stdout, stderr) => {
          if (err) {
            return reject(err);
          }
          resolve({
            title: opts.title,
            type: "ab",
            stdout,
            stderr
          });
        }
      );
    });
  });
}

const QUERY_DIR = `${__dirname}/../graphql`;
const queries = readdirSync(QUERY_DIR)
  .filter(filename => filename[0] !== "." && filename.endsWith(".graphql"))
  //.filter(filename => filename === "PopularThreads.graphql")
  .reduce((memo, filename) => {
    memo[filename] = readFileSync(`${QUERY_DIR}/${filename}`, "utf8");
    return memo;
  }, {});

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function memoryMonitor(pid) {
  const results = [];
  function get() {
    return new Promise(resolve => {
      execFile("/bin/ps", ["-o", "rss", `-p${pid}`], {}, (err, stdout) => {
        results.push([Date.now(), parseInt(stdout.split("\n")[1], 10)]);
        resolve();
      });
    });
  }
  const interval = setInterval(get, 500);
  get();
  return async function stop() {
    clearInterval(interval);
    await get();
    return results;
  };
}

async function runProgram(
  inName,
  inArgs = [
    "-c",
    "postgres://localhost/postgraphile_changes",
    "-s",
    "forum_example",
    "--disable-graphiql"
  ]
) {
  const [name, ...rest] = inName.split(/\s+/);
  const args = [...rest, ...inArgs];

  const child = spawn(name, args, {
    env: {
      NODE_ENV: "production",
      PATH: `${resolve(__dirname, "../node_modules/.bin/")}:${
        process.env.PATH
      }`,
      USER: process.env.USER
    },
    stdio: "pipe"
  });
  const channels = {
    stdout: "",
    stderr: ""
  };
  const log = channel => data => {
    if (!LOG_OUTPUT) return;
    channels[channel] = channels[channel] + data.toString();
    const lines = channels[channel].split(/\n/);
    const last = lines.pop();
    channels[channel] = last;
    lines.forEach(line => {
      console.log(`    [${channel}] ${line}`);
    });
  };
  child.stdout.on("data", log("stdout"));
  child.stderr.on("data", log("stderr"));
  const exitPromise = new Promise(resolve => {
    child.on("error", e => {
      console.error("ERROR", e);
      process.exit(1);
    });
    child.on("exit", signal => {
      if (!signal) {
        resolve();
      } else {
        console.error("ERROR", signal);
        process.exit(2);
      }
    });
  });
  await sleep(1000);
  const stop = async function() {
    child.kill("SIGTERM");
    return exitPromise;
  };
  stop.pid = child.pid;
  return stop;
}

async function main() {
  const allResults = [];
  for (const queryFileName in queries) {
    const query = queries[queryFileName];
    const variables = {};
    for (const program of [
      "postgraphile",
      "postgraphile --cluster-workers 3",
      "postgraphql",
    ]) {
      console.log(`Running ${program} with ${queryFileName}`);
      const exitProgram = await runProgram(program);
      const pid = exitProgram.pid;

      console.log("  Warmup...");
      await ab({
        url: "http://127.0.0.1:5000/graphql",
        method: "POST",
        body: JSON.stringify({
          query,
          variables
        }),
        headers: {
          "Content-Type": "application/json"
        },
        connections: 3,
        amount: 100,
        timeout: 200
      });
      console.log();
      console.log();

      for (const concurrency of [1, 10, 100]) {
        console.log("  Concurrency ", concurrency, "...");

        const exitMonitor = memoryMonitor(pid);

        const results = await ab({
          title: `${program} / ${queryFileName} / concurrency=${concurrency}`,
          url: "http://127.0.0.1:5000/graphql",
          method: "POST",
          body: JSON.stringify({
            query,
            variables
          }),
          headers: {
            "Content-Type": "application/json"
          },
          connections: concurrency,
          amount: 10 + concurrency * 4,
          duration: 1000,
          timeout: 200
        });
        results.memorySamples = await exitMonitor();
        allResults.push(results);
        if (LOG_OUTPUT) console.log(results);
        console.log();
        console.log();
      }

      console.log("Killing server...");
      await exitProgram();

      console.log(`Sleeping...`);
      await sleep(2000);
      console.log();
      console.log();
      console.log();
    }
  }
  writeFileSync(
    `${__dirname}/results.json`,
    JSON.stringify(allResults, null, 2)
  );
  require("./output");
}

main().then(
  () => {},
  e => {
    console.error("An error occurred");
    console.error(e);
    process.exit(1);
  }
);
