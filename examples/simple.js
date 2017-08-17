try {
    const BCDice = require('../dist/bcdice');

    const bcdice = BCDice.newBcDice('SwordWorld2_0');

    bcdice.setMessage('2d');
    console.log(bcdice.dice_command());

    bcdice.setMessage('K20');
    console.log(bcdice.dice_command());
} catch(e) {
    console.trace(e);
}