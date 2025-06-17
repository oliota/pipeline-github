const fs = require('fs');
const { execSync } = require('child_process');
const axios = require('axios');

const repo = process.env.GITHUB_REPOSITORY;
const [owner, repoName] = repo.split('/');
const token = process.env.GH_PAT;
const today = new Date().toISOString().split('T')[0];
const branch = `auto/${today}`;

const execHour = parseInt(process.env.EXEC_HOUR || '18');
const execMin = parseInt(process.env.EXEC_MIN || '50');

const now = new Date();
const currentHour = now.getUTCHours();
const currentMin = now.getUTCMinutes();

const isValidTime =
  currentHour === execHour &&
  Math.abs(currentMin - execMin) <= 1;

if (!isValidTime) {
  console.log(`Current time ${currentHour}:${currentMin} is outside execution window for ${execHour}:${execMin}. Skipping.`);
  process.exit(0);
}

const headers = {
  Authorization: `token ${token}`,
  'Content-Type': 'application/json',
  'User-Agent': 'daily-bot'
};

(async () => {
  execSync(`git config user.name "${process.env.GITHUB_ACTOR}"`);
  execSync(`git config user.email "${process.env.GITHUB_ACTOR}@users.noreply.github.com"`);
  execSync(`git checkout -b ${branch}`);
  fs.writeFileSync(`daily-${today}.txt`, `Daily contribution on ${today}`);
  execSync(`git add .`);
  execSync(`git commit -m "Daily commit on ${today}"`);
  execSync(`git push origin ${branch}`);

  const issue = await axios.post(
    `https://api.github.com/repos/${repo}/issues`,
    {
      title: `Daily Issue - ${today}`,
      body: 'Auto-generated daily issue.'
    },
    { headers }
  );

  const issueNumber = issue.data.number;

  const pr = await axios.post(
    `https://api.github.com/repos/${repo}/pulls`,
    {
      title: `Daily PR - ${today}`,
      head: branch,
      base: 'main',
      body: 'Auto-generated daily pull request.'
    },
    { headers }
  );

  const prNumber = pr.data.number;

  await axios.post(
    `https://api.github.com/repos/${repo}/pulls/${prNumber}/reviews`,
    {
      event: 'APPROVE'
    },
    { headers }
  );

  await axios.put(
    `https://api.github.com/repos/${repo}/pulls/${prNumber}/merge`,
    {
      merge_method: 'squash'
    },
    { headers }
  );

  await axios.patch(
    `https://api.github.com/repos/${repo}/issues/${issueNumber}`,
    { state: 'closed' },
    { headers }
  );
})();
