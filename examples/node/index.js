try {
    const BCDice = require('../../dist/bcdice');

    const bcdice = BCDice.newBcDice('KanColle');

    bcdice.setMessage('2d');
    console.log(bcdice.dice_command());

    bcdice.setMessage('BT2');
    console.log(bcdice.dice_command());

    bcdice.setMessage('2d>=7');
    console.log(bcdice.dice_command());
} catch(e) {
    console.trace(e);
}