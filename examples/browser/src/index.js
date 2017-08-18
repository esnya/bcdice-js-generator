import { newBcDice } from '../../../dist/bcdice';

const diceBotElement = document.getElementById('diceBot');
const inputElement = document.getElementById('input');
const rollElement = document.getElementById('roll');
const clearElement = document.getElementById('clear');
const resultsElement = document.getElementById('results');

rollElement.addEventListener('click', () => {
    const bcDice = newBcDice(diceBotElement.value || null);

    bcDice.setMessage(inputElement.value);
    const result = bcDice.dice_command();

    const resultElement = document.createElement('p');
    resultElement.innerText = result[0];
    resultsElement.appendChild(resultElement);
});

clearElement.addEventListener('click', () => {
    Array.prototype.map.call(resultsElement.children, (child) => resultsElement.removeChild(child));
});
