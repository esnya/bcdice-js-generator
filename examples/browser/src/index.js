import { newBcDice } from '../../../dist/bcdice';

const bcDice = newBcDice('SwordWorld2_0');

const inputElement = document.getElementById('input');
const rollElement = document.getElementById('roll');
const resultsElement = document.getElementById('results');

rollElement.addEventListener('click', () => {
    bcDice.setMessage(inputElement.value);
    const result = bcDice.dice_command();

    const resultElement = document.createElement('p');
    resultElement.innerText = result[0];
    resultsElement.appendChild(resultElement);
});
