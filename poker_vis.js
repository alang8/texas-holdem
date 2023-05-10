div.replaceChildren();

const container = document.createElement("div");
container.style.height = "80vh";
container.style.display = "flex";
container.style["flex-direction"] = "row";
container.style["justify-content"] = "center";
container.style["align-items"] = "center";
container.style["background-color"] = "#ebebeb";
container.style["flex-wrap"] = "wrap";
container.style.overflowY = "scroll";

function getCardImage(card) {
    const name = card.toString();
    if (name === "HA0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/sa.png";
    }
    else if (name === "H20") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/s2.png";
    }
    else if (name === "H30") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/s3.png";
    }
    else if (name === "H40") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/s4.png";
    }
    else if (name === "H50") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/s5.png";
    }
    else if (name === "H60") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/s6.png";
    }
    else if (name === "H70") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/s7.png";
    }
    else if (name === "H80") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/s8.png";
    }
    else if (name === "H90") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/s9.png";
    }
    else if (name === "H100") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/s10.png";
    }
    else if (name === "HJ0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/sj.png";
    }
    else if (name === "HQ0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/sq.png";
    }
    else if (name === "HK0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/sk.png";
    }
    else if (name === "SA0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/pa.png";
    }
    else if (name === "S20") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/p2.png";
    }
    else if (name === "S30") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/p3.png";
    }
    else if (name === "S40") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/p4.png";
    }
    else if (name === "S50") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/p5.png";
    }
    else if (name === "S60") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/p6.png";
    }
    else if (name === "S70") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/p7.png";
    }
    else if (name === "S80") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/p8.png";
    }
    else if (name === "S90") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/p9.png";
    }
    else if (name === "S100") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/p10.png";
    }
    else if (name === "SJ0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/pj.png";
    }
    else if (name === "SQ0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/pq.png";
    }
    else if (name === "SK0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/pk.png";
    }
    else if (name === "DA0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/la.png";
    }
    else if (name === "D20") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/l2.png";
    }
    else if (name === "D30") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/l3.png";
    }
    else if (name === "D40") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/l4.png";
    }
    else if (name === "D50") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/l5.png";
    }
    else if (name === "D60") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/l6.png";
    }
    else if (name === "D70") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/l7.png";
    }
    else if (name === "D80") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/l8.png";
    }
    else if (name === "D90") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/l9.png";
    }
    else if (name === "D100") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/l10.png";
    }
    else if (name === "DJ0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/lj.png";
    }
    else if (name === "DQ0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/lq.png";
    }
    else if (name === "DK0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/lk.png";
    }
    else if (name === "CK0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/ka.png";
    }
    else if (name === "C20") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/k2.png";
    }
    else if (name === "C30") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/k3.png";
    }
    else if (name === "C40") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/k4.png";
    }
    else if (name === "C50") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/k5.png";
    }
    else if (name === "C60") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/k6.png";
    }
    else if (name === "C70") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/k7.png";
    }
    else if (name === "C80") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/k8.png";
    }
    else if (name === "C90") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/k9.png";
    }
    else if (name === "C100") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/k10.png";
    }
    else if (name === "CJ0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/kj.png";
    }
    else if (name === "CQ0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/kq.png";
    }
    else if (name === "CK0") {
        return "https://www.improvemagic.com/wp-content/uploads/2020/11/kk.png";
    }
    else {
        return "https://www.researchgate.net/publication/334204491/figure/fig1/AS:776599045697537@1562167049292/Question-card-Symbol-question-mark-example-card.jpg";
    }
}
  
let state = Turn;
while (next.join(state).tuples().length > 0) {
    state = next.join(state);
}

do {
    const frame = document.createElement("div");
    frame.style.position = "relative";
    frame.style.width = "200px";
    frame.style.height = "250px";
    frame.style.margin = "10px";
    frame.style.padding = "0.5em";
    frame.style.textAlign = "center";
    frame.style.color = "white";
    frame.style["background-color"] = "gray";

    const playerCards = state.join(hands.cards).tuples();
    const playerCardDiv = document.createElement("div");
    const playerCardContainer = document.createElement("div");
    playerCardContainer.style.display = "flex";
    playerCardContainer.style["flex-direction"] = "row";
    playerCardContainer.style["justify-content"] = "center";
    playerCardContainer.style["align-items"] = "center";
    playerCardContainer.style["flex-wrap"] = "wrap";

    const playerCardP = document.createElement("p");
    playerCardP.innerText = "Player Hands";
    playerCardDiv.appendChild(playerCardP);

    for (const idx in playerCards) {
        const card = playerCards[idx];
        const imgSrc = getCardImage(card);
        const img = document.createElement("img");
        img.src = imgSrc;
        img.style.width = "30px";
        img.style.height = "50px";
        img.style.margin = "5px";
        playerCardContainer.appendChild(img);
    }

    playerCardDiv.appendChild(playerCardContainer);
    frame.appendChild(playerCardDiv);

    const tableCards = state.join(table).tuples();
    const tableCardDiv = document.createElement("div");
    const tableCardContainer = document.createElement("div");
    tableCardContainer.style.display = "flex";
    tableCardContainer.style["flex-direction"] = "row";
    tableCardContainer.style["justify-content"] = "center";
    tableCardContainer.style["align-items"] = "center";
    tableCardContainer.style["flex-wrap"] = "wrap";

    const tableCardP = document.createElement("p");
    tableCardP.innerText = "Table";
    tableCardDiv.appendChild(tableCardP);

    for (const idx in tableCards) {
        const card = tableCards[idx];
        const imgSrc = getCardImage(card);
        const img = document.createElement("img");
        img.src = imgSrc;
        img.style.width = "30px";
        img.style.height = "50px";
        img.style.margin = "3px";
        tableCardContainer.appendChild(img);
    }

    tableCardDiv.appendChild(tableCardContainer);
    frame.appendChild(tableCardDiv);
    frame.style.backgroundColor = "rgb(53, 101, 77)";
    container.appendChild(frame);
    state = state.join(next);
} while (state.tuples()[0]);

div.appendChild(container);
