module.exports = (robot) => {

  // 1. Listen to all messages: "hear" matches a keyword anywhere in the message
  robot.hear(/badger/i, (res) => {
    res.send('Badger? Badger? Badger?');
  });

  // 2. Respond to direct commands: "respond" only matches "@botname command"
  robot.respond(/hello/i, (res) => {
    res.reply(`Hello ${res.message.user.name}!`);
  });

  // 3. Respond with captured arguments
  robot.respond(/echo (.*)/i, (res) => {
    res.send(res.match[1]);
  });

  // 4. Listen for users entering a room
  robot.enter((res) => {
    res.send(`Welcome to ${res.message.room}!`);
  });

  // 5. Listen for users leaving a room
  robot.leave((res) => {
    res.send('Goodbye!');
  });

};
