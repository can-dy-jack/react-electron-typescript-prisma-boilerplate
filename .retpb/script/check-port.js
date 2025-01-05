import chalk from 'chalk';
import detectPort from 'detect-port';

const PORT = process.env.PORT || '8000';

detectPort(PORT).then(realPort => {
  if (Number(PORT) == realPort) {
    process.exit(0);
  } else {
  const err = chalk.redBright(`warning from retpb: `) +
    chalk.whiteBright.bgRed.bold(
      `"localhost:${realPort}/" is already in use. Please use another port. ex: set port=8001 && yarn start`,
    )
  throw new Error(err);
  }
})
  .catch(err => {
    console.log(err);
  });

