import * as Octokit from "@octokit/rest";

const octokit = new Octokit();

const run = async (): Promise<void> => {

  const githubEmojiResponse = await octokit.emojis.get();

  // const githubEmojis: {[name: string]: string} = githubEmojiResponse.data;

  //process.stdout.write("gg");

  console.log(githubEmojiResponse.headers);

};

run();

