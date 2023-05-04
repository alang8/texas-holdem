#lang forge

option problem_type temporal
option max_tracelength 15

-- Definitions

abstract sig Card {
    suit: one Int,
    rank: one Int
}

// abstract sig Rank {}
// one sig Two, Three, Four, Five, Six, Seven, Nine, Ten, Jack, Queen, King, Ace extends Rank {}
 
// abstract sig Suit {}
// one sig Clubs, Diamonds, Hearts, Spades extends Suit {}

// sig Card {
//     suit: one Rank,
//     rank: one Suit
// }

// Hearts
one sig HA extends Card {}
one sig H2 extends Card {}
one sig H3 extends Card {}
one sig H4 extends Card {}
one sig H5 extends Card {}
one sig H6 extends Card {}
one sig H7 extends Card {}
one sig H8 extends Card {}
one sig H9 extends Card {}
one sig H10 extends Card {}
one sig HJ extends Card {}
one sig HQ extends Card {}
one sig HK extends Card {}

// Diamonds
one sig DA extends Card{}
one sig D2 extends Card{}
one sig D3 extends Card{}
one sig D4 extends Card{}
one sig D5 extends Card{}
one sig D6 extends Card{}
one sig D7 extends Card{}
one sig D8 extends Card{}
one sig D9 extends Card{}
one sig D10 extends Card{}
one sig DJ extends Card{}
one sig DQ extends Card{}
one sig DK extends Card{}

// Clubs
one sig CA extends Card{}
one sig C2 extends Card{}
one sig C3 extends Card{}
one sig C4 extends Card{}
one sig C5 extends Card{}
one sig C6 extends Card{}
one sig C7 extends Card{}
one sig C8 extends Card{}
one sig C9 extends Card{}
one sig C10 extends Card{}
one sig CJ extends Card{}
one sig CQ extends Card{}
one sig CK extends Card{}

// Spades
one sig SA extends Card {}
one sig S2 extends Card {}
one sig S3 extends Card {}
one sig S4 extends Card {}
one sig S5 extends Card {}
one sig S6 extends Card {}
one sig S7 extends Card {}
one sig S8 extends Card {}
one sig S9 extends Card {}
one sig S10 extends Card {}
one sig SJ extends Card {}
one sig SQ extends Card {}
one sig SK extends Card {}

sig Hand {
    hcards: set Card
}

one sig Table {
    dealt: set Card
}

one sig Deck {
    cards: set Card
}

-- Game operations

// What makes a set of cards different
pred different[cards: set Card] {
    all disj c1, c2: cards | {
        c1.suit != c2.suit or c1.rank != c2.rank
    }
}

// Get the highest card from a hand
// fun highest_card[h: Hand] : Card {
//     h.card1.rank > h.card2.rank => h.card1
//     h.card2.rank > h.card1.rank => h.card2
//     h.card1.rank = h.card2.rank => h.card1
// }

// Check for wellformed deck
pred wellformed_deck {
    -- Check that the cards in hands/table are not in the deck
    all c: Card - Hand.hcards - Table.dealt | {
        c in Deck.cards 
    }
    -- Check for no duplicate cards
    different[Deck.cards]
}

// Check for wellformed hands
pred wellformed_hands {
    -- Check that each hand has 2 cards
    all h: Hand | {
        #{h.hcards} = 2
    }
    -- Check that the cards between hands are different
    all disj h1, h2: Hand | {
        #{h1.hcards & h2.hcards} = 0
    }
    -- Check that the cards are not dealt on the table
    all h: Hand | {
        h.hcards not in Table.dealt
    }
}

// Check for wellformed table
pred wellformed_table {
    -- Check that the table has a valid number of cards
    #{c : Card | c in Table.dealt} > 2
    #{c : Card | c in Table.dealt} < 6
    -- Check for no duplicate cards
    different[Table.dealt]
}

// Deal cards to each player
pred deal[num_players: Int] {
    #{Hand} = num_players
    wellformed_hands
}

// Flop the first three cards
pred flop {
    #{c : Card | c in Table.dealt} = 3
    wellformed_table
}

// Deal a new card to the table
pred draw {
    some c: Card | {
        c in Deck.cards
        Table.dealt' = Table.dealt + c
        Deck.cards' = Deck.cards - c
    }
    wellformed_table
    Hand.hcards' = Hand.hcards
}

// pred high_card_win {
//     all h: Hand | {
//         h != mh => {
//         highest_card[mh].rank > highest_card[h].rank
//         }
//     } 
// }

pred pair_win {
    some h: Hand | {
        -- A pair is formed within a hand OR
        -- A pair is formed between a hand and the table
        some disj c1, c2 : Card | {
            c1 in h.hcards + Table.dealt
            c2 in h.hcards + Table.dealt
            c1.rank = c2.rank
        }
        different[Deck.cards + h.hcards + Table.dealt]
    }
}

// Determine the winning hand
pred winner {
    // high_card_win
    pair_win
}

// Set the cards in the deck
pred Values {
    -- 1 = Hearts, 2 = Diamonds, 3 = Clubs, 4 = Spades
    -- 1 = Ace, 2-10 = 2-10, 11 = Jack, 12 = Queen, 13 = King
    -- Hearts
    HA.suit = 1 and HA.rank = 1
    H2.suit = 1 and H2.rank = 2
    H3.suit = 1 and H3.rank = 3
    H4.suit = 1 and H4.rank = 4
    H5.suit = 1 and H5.rank = 5
    H6.suit = 1 and H6.rank = 6
    H7.suit = 1 and H7.rank = 7
    H8.suit = 1 and H8.rank = 8
    H9.suit = 1 and H9.rank = 9
    H10.suit = 1 and H10.rank = 10
    HJ.suit = 1 and HJ.rank = 11
    HQ.suit = 1 and HQ.rank = 12
    HK.suit = 1 and HK.rank = 13

    -- Diamonds
    DA.suit = 2 and DA.rank = 1
    D2.suit = 2 and D2.rank = 2
    D3.suit = 2 and D3.rank = 3
    D4.suit = 2 and D4.rank = 4
    D5.suit = 2 and D5.rank = 5
    D6.suit = 2 and D6.rank = 6
    D7.suit = 2 and D7.rank = 7
    D8.suit = 2 and D8.rank = 8
    D9.suit = 2 and D9.rank = 9
    D10.suit = 2 and D10.rank = 10
    DJ.suit = 2 and DJ.rank = 11
    DQ.suit = 2 and DQ.rank = 12
    DK.suit = 2 and DK.rank = 13
    
    -- Clubs
    CA.suit = 3 and CA.rank = 1
    C2.suit = 3 and C2.rank = 2
    C3.suit = 3 and C3.rank = 3
    C4.suit = 3 and C4.rank = 4
    C5.suit = 3 and C5.rank = 5
    C6.suit = 3 and C6.rank = 6
    C7.suit = 3 and C7.rank = 7
    C8.suit = 3 and C8.rank = 8
    C9.suit = 3 and C9.rank = 9
    C10.suit = 3 and C10.rank = 10
    CJ.suit = 3 and CJ.rank = 11
    CQ.suit = 3 and CQ.rank = 12
    CK.suit = 3 and CK.rank = 13

    -- Spades
    SA.suit = 4 and SA.rank = 1
    S2.suit = 4 and S2.rank = 2
    S3.suit = 4 and S3.rank = 3
    S4.suit = 4 and S4.rank = 4
    S5.suit = 4 and S5.rank = 5
    S6.suit = 4 and S6.rank = 6
    S7.suit = 4 and S7.rank = 7
    S8.suit = 4 and S8.rank = 8
    S9.suit = 4 and S9.rank = 9
    S10.suit = 4 and S10.rank = 10
    SJ.suit = 4 and SJ.rank = 11
    SQ.suit = 4 and SQ.rank = 12
    SK.suit = 4 and SK.rank = 13
}

// No changes to the game
pred DoNothing {
    Deck.cards' = Deck.cards
    Hand.hcards' = Hand.hcards
    Table.dealt' = Table.dealt
}

// Initialize the game
pred init {
    wellformed_deck
    Values
    flop
    deal[3]
    winner
}

pred traces {
    init
    // always (draw until #{c : Card | c in Table.dealt} = 5) or DoNothing
    // eventually reset
}

run {traces} for 7 Int
