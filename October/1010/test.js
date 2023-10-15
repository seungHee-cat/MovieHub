const pieces = [];
const puzzleContainer = document.getElementById("puzzle");

function initialize() {
    for (let i = 0; i <= 8; i++) {
        pieces.push(i);
    }
    shuffle(pieces);

    for (let i = 0; i < 3; i++){
        for (let j = 0; j < 3; j++){
            const index = i * 3 + j;
            const piece = document.createElement("input");
            piece.type = "button";
            piece.value = pieces[index];
            piece.onclick = () => switchNumber(pieces[index]);
            puzzleContainer.appendChild(piece);
        }
        puzzleContainer.appendChild(document.createElement("br"));
    }
}
function shuffle(arr) {
    for (let i = arr.length - 1; i > 0; i--){
        const j = Math.floor(Math.random() * (i + 1));
        [arr[i], arr[j]] = [arr[j], arr[i]];
    }
}
function switchNumber(clickedPiece) {
    const clickedIndex = pieces.indexOf(clickedPiece);
    const zeroIndex = pieces.indexOf(0);

    if (isClosed(clickedIndex, zeroIndex)) {
        [pieces[clickedIndex], pieces[zeroIndex]] = [pieces[zeroIndex], pieces[clickedIndex]];

        refreshPuzzle();

        if (isWinning()) {
            alert("축하합니다! 게임을 이기셨습니다!");
            if (confirm("게임을 다시 시작하시겠습니까?")) {
                resetGame();
            }
        }
    }
}
function isClosed(index1, index2) {
    const row1 = Math.floor(index1 / 3);
    const col1 = index1 % 3;
    const row2 = Math.floor(index2 / 3);
    const col2 = index2 % 3;

    return (row1 == row2 && Math.abs(col1 - col2) == 1) ||
        (Math.abs(row1 - row2) == 1 && col1 == col2);
}
function refreshPuzzle() {
    const inputs = document.querySelectorAll("#puzzle input");
    inputs.forEach((input, index) => {
        input.value = pieces[index];
    });
}
function isWinning() {
    return pieces.join() === '123456780';
}
function resetGame() {
    pieces.length = 0;
    puzzleContainer.innerHTML = '';
    initialize();
}

initialize();