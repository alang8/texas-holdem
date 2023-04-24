#lang forge

option problem_type temporal
option max_tracelength 15

-- Definitions

sig Card {
    suit: one Int
    rank: one Int
}

sig Hand {
    card1: one Card
    card2: one Card
}

one sig Deck {
    cards: set Card
    size: one Int
}

-- Game operations

// Check for wellformed deck
pred wellformed_deck {
    -- Check for correct size
    Deck.size = 52
    -- Check for correct card suits/ranks
    -- 1 = Hearts, 2 = Diamonds, 3 = Clubs, 4 = Spades
    -- 1 = Ace, 2-10 = 2-10, 11 = Jack, 12 = Queen, 13 = King
    all c: Card | {
        c in Deck.cards
        c.suit > 0 and c.suit < 5
        c.rank > 0 and c.rank < 14
    }
    -- Check for no duplicate cards
    all disj c1, c2: Card | c1 in Deck.cards and c2 in Deck.cards {
        different[c1, c2]
    }
}

// Check for wellformed hands
pred wellformed_hands {
    -- Check that each hand is wellformed
    for all h: Hand | {
        -- Check that cards are in the deck
        h.card1, h.card2 in Deck.cards
        -- Check that cards are different
        different[h.card1, h.card2]
    }
    -- Check that the cards between hands are different
    for all disj h1, h2: Hand | {
        different[h1.card1, h2.card1]
        different[h1.card1, h2.card2]
        different[h1.card2, h2.card1]
        different[h1.card2, h2.card2]
    }
}

// What makes two cards different
pred different[c1, c2: Card] {
    c1.suit != c2.suit or c1.rank != c2.rank
}

// Initialize the game
pred init {
    wellformed_deck
    wellformed_hands
}

run {init}