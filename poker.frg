#lang forge

-- Definitions

abstract sig Card {
    suit: one Int,
    rank: one Int
}

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
    cards: set Card
}

sig Turn {
    hands: set Hand,
    table: set Card,
    deck: set Card,
    folds: set Hand,
    next: lone Turn
}

-- Game operations

// What makes a set of cards different
pred different[cs: set Card] {
    all disj c1, c2: cs | {
        c1.suit != c2.suit or c1.rank != c2.rank
    }
}

// Check for wellformed deck
pred wellformed_deck[t: Turn] {
    -- Check that the cards in the deck = those not in the hands or table
    t.deck = Card - t.hands.cards - t.table
}

// Check for wellformed hands
pred wellformed_hands[t: Turn] {
    -- Check that each hand has two cards
    all h: t.hands | {
        #{h.cards} = 2
    }
    -- Check for no duplicate cards
    all disj h1, h2: t.hands | {
        #{h1.cards & h2.cards} = 0
    }
    -- Check that cards in hand are not in the table
    all h: t.hands | {
        all c: h.cards | {
            c not in t.table
        }
    }
}

// Check for wellformed table
pred wellformed_table[t: Turn] {
    -- Check that the table has a valid number of cards
    #{c : Card | c in t.table} > 2
    #{c : Card | c in t.table} < 6
    -- Check for no duplicate cards
    different[t.table]
}

pred wellformed[t: Turn] {
    wellformed_deck[t]
    wellformed_hands[t]
    wellformed_table[t]
}

// Flop the first three cards
pred flop[t: Turn] {
    #{c : Card | c in t.table} = 3
}

pred pair_win[t: Turn] {
    some h: t.hands - t.folds | {
        -- A pair is formed within a hand OR
        -- A pair is formed between a hand and the table
        some disj c1, c2 : Card | {
            c1 in h.cards + t.table
            c2 in h.cards + t.table
            c1.rank = c2.rank
        }
    }
}

pred two_pair_win[t: Turn] {
    some h: t.hands - t.folds | {
        -- A pair is formed within a hand OR
        -- A pair is formed between a hand and the table
        some disj c1, c2, c3, c4 : Card | {
            c1 in h.cards + t.table
            c2 in h.cards + t.table
            c3 in h.cards + t.table
            c4 in h.cards + t.table
            c1.rank = c2.rank
            c3.rank = c4.rank
            c1.rank != c3.rank
        }
    }
}

pred three_kind_win[t: Turn] {
    some h: t.hands - t.folds | {
        -- A triplet is formed between a hand and the table
        some disj c1, c2, c3 : Card | {
            c1 in h.cards + t.table
            c2 in h.cards + t.table
            c3 in h.cards + t.table
            c1.rank = c2.rank
            c2.rank = c3.rank
        }
    }
}

pred straight_win[t: Turn] {
    some h: t.hands - t.folds | {
        -- Five cards have consecutive ranks between a hand and the table
        some disj c1, c2, c3, c4, c5: Card | {
            c1 in h.cards + t.table
            c2 in h.cards + t.table
            c3 in h.cards + t.table
            c4 in h.cards + t.table
            c5 in h.cards + t.table
            c5.rank = add[c4.rank, 1]
            c4.rank = add[c3.rank, 1]
            c3.rank = add[c2.rank, 1]
            c2.rank = add[c1.rank, 1]
        }
    }
}

pred flush_win[t: Turn] {
    some h: t.hands - t.folds | {
        -- Five cards have the same suit between a hand and the table
        some disj c1, c2, c3, c4, c5: Card | {
            c1 in h.cards + t.table
            c2 in h.cards + t.table
            c3 in h.cards + t.table
            c4 in h.cards + t.table
            c5 in h.cards + t.table
            c1.suit = c2.suit
            c2.suit = c3.suit
            c3.suit = c4.suit
            c4.suit = c5.suit
        }
    }
}

pred full_house_win[t: Turn] {
    some h: t.hands - t.folds | {
        -- A triplet and a pair is formed between
        -- a hand and the table
        some disj c1, c2, c3, c4, c5 : Card | {
            c1 in h.cards + t.table
            c2 in h.cards + t.table
            c3 in h.cards + t.table
            c4 in h.cards + t.table
            c5 in h.cards + t.table
            c1.rank = c2.rank
            c2.rank = c3.rank
            c4.rank = c5.rank
            c1.rank != c4.rank
        }
    }
}

pred four_kind_win[t: Turn] {
    some h: t.hands - t.folds | {
        -- A quadruplet is formed between a hand and the table
        some disj c1, c2, c3, c4 : Card | {
            c1 in h.cards + t.table
            c2 in h.cards + t.table
            c3 in h.cards + t.table
            c4 in h.cards + t.table
            c1.rank = c2.rank
            c2.rank = c3.rank
            c3.rank = c4.rank
        }
    }
}

pred straight_flush_win[t: Turn] {
    some h: t.hands - t.folds | {
        -- Five cards have consecutive ranks between a hand and the table
        -- These five cards are also of the same suit
        some disj c1, c2, c3, c4, c5: Card | {
            c1 in h.cards + t.table
            c2 in h.cards + t.table
            c3 in h.cards + t.table
            c4 in h.cards + t.table
            c5 in h.cards + t.table
            c5.rank = add[c4.rank, 1]
            c4.rank = add[c3.rank, 1]
            c3.rank = add[c2.rank, 1]
            c2.rank = add[c1.rank, 1]
            c1.suit = c2.suit
            c2.suit = c3.suit
            c3.suit = c4.suit
            c4.suit = c5.suit
        }
    }
}

pred royal_flush_win[t: Turn] {
    some h: t.hands - t.folds | {
        -- Five cards A, K, Q, J, 10 between a hand and the table
        -- These five cards are also of the same suit
        some disj c1, c2, c3, c4, c5: Card | {
            c1 in h.cards + t.table
            c2 in h.cards + t.table
            c3 in h.cards + t.table
            c4 in h.cards + t.table
            c5 in h.cards + t.table
            c5.rank = 13
            c4.rank = 12
            c3.rank = 11
            c2.rank = 10
            c1.rank = 1
            c1.suit = c2.suit
            c2.suit = c3.suit
            c3.suit = c4.suit
            c4.suit = c5.suit
        }
    }
}

pred fold_win[t: Turn] {
    #{t.folds} = 3
}

// Determine the winning hand
pred winner[t: Turn] {
    // pair_win[t]
    // two_pair_win[t]
    // three_kind_win[t]
    straight_win[t]
    flush_win[t]
    // full_house_win[t]
    // four_kind_win[t]
    // straight_flush_win[t]
    // royal_flush_win[t]
    // fold_win[t]
}

pred algo1[h: Hand] {
    some c1, c2: Card | {
        c1 in h.cards 
        c2 in h.cards
        // When X≤6, any hand except「X+X」or「X+A」should be folded
        (c1.rank <= 6) and (c1.rank != c2.rank) and (c2.rank != 1)
    }
}

pred algo2[h: Hand] {
    some c1, c2: Card | {
        c1 in h.cards 
        c2 in h.cards
        // Any hand with seven, except「7+7」,「7+A」or「7+8」should be folded
        (c1.rank = 7) and (c2.rank != 7) and (c2.rank != 1) and (c2.rank != 8)
    }
}

pred algo3[h: Hand] {
    some c1, c2: Card | {
        c1 in h.cards 
        c2 in h.cards
        // Any hand with eight, except「8+8」,「8+A」,「8+7」,「8+9」or「8+10」should be folded
        (c1.rank = 8) and (c2.rank != 1) and (c2.rank != 7) and (c2.rank != 8) and (c2.rank != 9) and (c2.rank != 10)
    }
}

pred algo4[h: Hand] {
    some c1, c2: Card | {
        c1 in h.cards 
        c2 in h.cards
        // When X≤7, any hand with「X+9」should be also folded
        (c1.rank <= 7) and (c2.rank = 9)
    }
}

pred algo5[cs: set Card] {
    some c1, c2: Card | {
        c1 in cs
        c2 in cs
        // There is a pair within your hand
        // or with a card in your hand and the table
        c1.rank = c2.rank
    }
}

// Determine which hands fold at a given turn
pred fold[pre: Turn, post: Turn] {
    all h: Hand | {
        h in pre.hands
        // Simple poker folding algorithm
        // {(algo1[h] or algo2[h] or algo3[h] or algo4[h] or h in pre.folds) and (algo5[h.cards + pre.table]) => 
        // (h in post.folds) else (h not in post.folds)}
        {(algo1[h] or algo2[h] or algo3[h] or algo4[h]) and (algo5[h.cards + pre.table]) => 
        (h in post.folds) else (h not in post.folds)}
    }
    pre.hands = post.hands
    pre.table = post.table
}

// Draw a new card to the table
pred draw[pre: Turn, post: Turn] {
    some c: pre.deck | {
        post.table = pre.table + c
        post.deck = pre.deck - c
    }
    pre.hands = post.hands
    pre.folds = post.folds
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

// Initialize the game
pred init[t: turn] {
    flop[t]
    // How many hands are dealt
    // Change this to set number of players
    #{t.hands} = 4
    // At least one player folds, but not all
    #{t.folds} = 1
    #{t.folds} < 4
}

// End of the game
pred final[t: turn] {
    #{t.table} = 5
    // Change this to set number of players
    #{t.hands} = 4
    // The win will happen on the last turn
    winner[t]
}

// Run through the states of the game
pred traces {
    some i, f: Turn | {
        init[i]
        final[f]
        reachable[f, i, next]
    }
    all t: Turn | some t.next => {
        // If a player folds, the draw is paused
        fold[t, t.next] or draw[t, t.next]   
    }
}

run {
    all t: Turn | wellformed[t]
    traces
    Values
} for exactly 4 Turn, 7 Int for {next is linear}
