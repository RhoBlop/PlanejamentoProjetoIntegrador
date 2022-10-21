const fs = require("fs");

const [numContrato, offset] = process.argv.slice(2);

const getRandomNumber = (min, max) => {
    return Math.floor(Math.random() * (max - min + 1) + min);
};

let text = "";
for (i = offset; i <= numContrato; i++) {
    let idContrato = i;
    let rating = getRandomNumber(1, 5);
    let comentario = "Avaliacao" + idContrato;
    text += `(${idContrato}, ${rating}, '${comentario}'),\n`;
}

fs.writeFile("./avaliacoes.txt", text, (err) => {
    if (err) {
        console.error(err);
        return;
    }
});
