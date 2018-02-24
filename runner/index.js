const { resolve } = require("path");
const { spawn } = require("child_process");
const { readdirSync, readFileSync } = require("fs");

const QUERY_DIR = `${__dirname}/../graphql`;
const queries = readdirSync(QUERY_DIR)
  .filter(filename => filename[0] !== "." && filename.endsWith(".graphql"))
  .reduce((memo, filename) => {
    memo[filename] = readFileSync(`${QUERY_DIR}/${filename}`, "utf8");
    return memo;
  }, {});

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function runProgram(
  name,
  args = [
    "-c",
    "postgres://localhost/postgraphile_changes",
    "-s",
    "forum_example",
    "--disable-graphiql"
  ]
) {
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
  await sleep(1000);
  const exitPromise = new Promise((resolve, reject) =>
    child.on(
      "exit",
      signal => (!signal ? resolve() : reject(new Error("Signal " + signal)))
    )
  );
  return async function() {
    child.kill();
    return exitPromise;
  };
}

async function main() {
  for (const queryFileName in queries) {
    const query = queries[queryFileName];
    for (const program of ["postgraphql", "postgraphile", "postgraphql"]) {
      console.log(`Running ${program} with ${queryFileName}`);
      const exitProgram = await runProgram(program);

      await exitProgram();

      console.log(`Sleeping...`);
      await sleep(2000);
      console.log();
      console.log();
      console.log();
    }
  }
}

main().then(null, e => {
  console.error("An error occurred");
  console.error(e);
  process.exit(1);
});
