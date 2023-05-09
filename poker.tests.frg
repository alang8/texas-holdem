#lang forge

open "poker.frg"

test suite for pair_win {
    example pair_win_example is {some t : Turn | Values and pair_win[t]} for {
        --Instance of a Turn
        Turn = `Turn0
        --Instances of Hearts
        HA = `HA
        H2 = `H2
        H3 = `H3
        H4 = `H4
        H5 = `H5
        H6 = `H6
        H7 = `H7
        H8 = `H8
        H9 = `H9
        H10 = `H10
        HJ = `HJ
        HQ = `HQ
        HK = `HK
        --Instances of Diamonds
        DA = `DA
        D2 = `D2
        D3 = `D3
        D4 = `D4
        D5 = `D5
        D6 = `D6
        D7 = `D7
        D8 = `D8
        D9 = `D9
        D10 = `D10
        DJ = `DJ
        DQ = `DQ
        DK = `DK
        --Instances of Clubs
        CA = `CA
        C2 = `C2
        C3 = `C3
        C4 = `C4
        C5 = `C5
        C6 = `C6
        C7 = `C7
        C8 = `C8
        C9 = `C9
        C10 = `C10
        CJ = `CJ
        CQ = `CQ
        CK = `CK
        --Instances of Spades
        SA = `SA
        S2 = `S2
        S3 = `S3
        S4 = `S4
        S5 = `S5
        S6 = `S6
        S7 = `S7
        S8 = `S8
        S9 = `S9
        S10 = `S10
        SJ = `SJ
        SQ = `SQ
        SK = `SK
        --Instaces of Cards
        Card = HA + H2 + H3 + H4 + H5 + H6 + H7 + H8 + H9 + H10 + HJ + HQ + HK +
            DA + D2 + D3 + D4 + D5 + D6 + D7 + D8 + D9 + D10 + DJ + DQ + DK +
            CA + C2 + C3 + C4 + C5 + C6 + C7 + C8 + C9 + C10 + CJ + CQ + CK +
            SA + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9 + S10 + SJ + SQ + SK
        --Instaces of Hands
        Hand = `Hand0 + `Hand1 + `Hand2
        --Adding Hands to the Turn
        hands = `Turn0 -> `Hand0 + `Turn0 -> `Hand1 + `Turn0 -> `Hand2
        --Adding Cards to the table for this Turn
        table = `Turn0 -> HA + `Turn0 -> H2 + `Turn0 -> H3
        --Adding Cards to the Hands for this turn
        cards = `Hand0 -> CA + `Hand0 -> H5 +
                `Hand1 -> H6 + `Hand1 -> H7 + 
                `Hand2 -> H8 + `Hand2 -> H9
    }
}

test suite for two_pair_win {
    example two_pair_win_example is {some t : Turn | Values and two_pair_win[t]} for {
        --Instance of a Turn
        Turn = `Turn0
        --Instances of Hearts
        HA = `HA
        H2 = `H2
        H3 = `H3
        H4 = `H4
        H5 = `H5
        H6 = `H6
        H7 = `H7
        H8 = `H8
        H9 = `H9
        H10 = `H10
        HJ = `HJ
        HQ = `HQ
        HK = `HK
        --Instances of Diamonds
        DA = `DA
        D2 = `D2
        D3 = `D3
        D4 = `D4
        D5 = `D5
        D6 = `D6
        D7 = `D7
        D8 = `D8
        D9 = `D9
        D10 = `D10
        DJ = `DJ
        DQ = `DQ
        DK = `DK
        --Instances of Clubs
        CA = `CA
        C2 = `C2
        C3 = `C3
        C4 = `C4
        C5 = `C5
        C6 = `C6
        C7 = `C7
        C8 = `C8
        C9 = `C9
        C10 = `C10
        CJ = `CJ
        CQ = `CQ
        CK = `CK
        --Instances of Spades
        SA = `SA
        S2 = `S2
        S3 = `S3
        S4 = `S4
        S5 = `S5
        S6 = `S6
        S7 = `S7
        S8 = `S8
        S9 = `S9
        S10 = `S10
        SJ = `SJ
        SQ = `SQ
        SK = `SK
        --Instaces of Cards
        Card = HA + H2 + H3 + H4 + H5 + H6 + H7 + H8 + H9 + H10 + HJ + HQ + HK +
            DA + D2 + D3 + D4 + D5 + D6 + D7 + D8 + D9 + D10 + DJ + DQ + DK +
            CA + C2 + C3 + C4 + C5 + C6 + C7 + C8 + C9 + C10 + CJ + CQ + CK +
            SA + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9 + S10 + SJ + SQ + SK
        --Instaces of Hands
        Hand = `Hand0 + `Hand1 + `Hand2
        --Adding Hands to the Turn
        hands = `Turn0 -> `Hand0 + `Turn0 -> `Hand1 + `Turn0 -> `Hand2
        --Adding Cards to the table for this Turn
        table = `Turn0 -> C2 + `Turn0 -> H2 + `Turn0 -> H3
        --Adding Cards to the Hands for this turn
        cards = `Hand0 -> CA + `Hand0 -> HA +
                `Hand1 -> H6 + `Hand1 -> H7 + 
                `Hand2 -> H8 + `Hand2 -> H9
    }
}
test suite for three_kind_win {
    example three_kind_win_example is {some t : Turn | Values and three_kind_win[t]} for {
        --Instance of a Turn
        Turn = `Turn0
        --Instances of Hearts
        HA = `HA
        H2 = `H2
        H3 = `H3
        H4 = `H4
        H5 = `H5
        H6 = `H6
        H7 = `H7
        H8 = `H8
        H9 = `H9
        H10 = `H10
        HJ = `HJ
        HQ = `HQ
        HK = `HK
        --Instances of Diamonds
        DA = `DA
        D2 = `D2
        D3 = `D3
        D4 = `D4
        D5 = `D5
        D6 = `D6
        D7 = `D7
        D8 = `D8
        D9 = `D9
        D10 = `D10
        DJ = `DJ
        DQ = `DQ
        DK = `DK
        --Instances of Clubs
        CA = `CA
        C2 = `C2
        C3 = `C3
        C4 = `C4
        C5 = `C5
        C6 = `C6
        C7 = `C7
        C8 = `C8
        C9 = `C9
        C10 = `C10
        CJ = `CJ
        CQ = `CQ
        CK = `CK
        --Instances of Spades
        SA = `SA
        S2 = `S2
        S3 = `S3
        S4 = `S4
        S5 = `S5
        S6 = `S6
        S7 = `S7
        S8 = `S8
        S9 = `S9
        S10 = `S10
        SJ = `SJ
        SQ = `SQ
        SK = `SK
        --Instaces of Cards
        Card = HA + H2 + H3 + H4 + H5 + H6 + H7 + H8 + H9 + H10 + HJ + HQ + HK +
            DA + D2 + D3 + D4 + D5 + D6 + D7 + D8 + D9 + D10 + DJ + DQ + DK +
            CA + C2 + C3 + C4 + C5 + C6 + C7 + C8 + C9 + C10 + CJ + CQ + CK +
            SA + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9 + S10 + SJ + SQ + SK
        --Instaces of Hands
        Hand = `Hand0 + `Hand1 + `Hand2
        --Adding Hands to the Turn
        hands = `Turn0 -> `Hand0 + `Turn0 -> `Hand1 + `Turn0 -> `Hand2
        --Adding Cards to the table for this Turn
        table = `Turn0 -> HA + `Turn0 -> H2 + `Turn0 -> C8
        --Adding Cards to the Hands for this turn
        cards = `Hand0 -> D8 + `Hand0 -> S8 +
                `Hand1 -> H6 + `Hand1 -> H7 + 
                `Hand2 -> H8 + `Hand2 -> H9
    }
}

