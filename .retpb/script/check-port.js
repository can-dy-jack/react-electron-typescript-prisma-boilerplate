import chalk from 'chalk';
import detectPort from 'detect-port';

const PORT = process.env.PORT || '1234';

detectPort(PORT).then(realPort => {
  if (Number(PORT) == realPort) {
    process.exit(0);
  } else {
    throw new Error(
      chalk.whiteBright.bgRed.bold(
        `Port "${PORT}" on "localhost" is already in use. Please use another port. ex: PORT=8081 npm start`,
      ),
    );
  }
})
.catch(err => {
  console.log(err);
});

