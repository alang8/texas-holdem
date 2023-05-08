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
    function make_table(table) {
        for (const card of table) {
            div.appendChild(make_card(card))
        }
    }

    const table = make_table(pre.table)    

    const div = document.createElement('div')
    div.style.width = '100%'
    div.style.height = '100%'
    div.style.display = 'flex'
    div.style['flex-direction'] = 'column'
    div.style['justify-content'] = 'center'
    div.style['align-items'] = 'center'
    div.style['background-color'] = 'green'

    state = state.join(next);
    i++;
} while (state.tuples()[0]);
