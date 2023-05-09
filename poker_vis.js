const card = Card

function make_card(url) {
    const img = document.createElement('img')
    img.src = url
    img.style.width = '100%'
    img.style.height = '15%'
    img.style.display = 'block'
    img.style['margin-bottom'] = '10%'
    return img;
}

function make_blank() {
    const div = make_card('https://media.istockphoto.com/id/1092139474/photo/empty-green-casino-poker-table-cloth-with-spotlight.jpg?s=612x612&w=0&k=20&c=0TwjfTAxxMdBPKBnnrhRDmsvYS7ui3Ly_u9HZms8QAc=')
    div.style.opacity = '0%'
    return div
}

div.replaceChildren() // remove all content

let state = Turn;

while (next.join(state).tuples().length > 0) {
    state = next.join(state)
}

let i = 0;

do {
    const pre = state;
    const post = state.join(next)
    
    // takes in a set of cards and makes them
    // function make_table(table) {
    //     for (const card of table) {
    //         div.appendChild(make_card(card))
    //     }
    // }

    // const table = make_table(pre.table)    

    const board = document.createElement('board')
    board.style.width = '50%'
    board.style.height = '50%'
    board.style.margin = '1%'
    board.style.marginRight = '0'
    board.style.padding = '0.5em'
    board.style.border = '5px solid black'
    board.style.display = 'inline-block'
    board.style.color = 'white'
    board.style["background-color"] = '#35654d'

    div.appendChild(board)

    state = state.join(next);
    i++;
} while (state.tuples()[0]);
