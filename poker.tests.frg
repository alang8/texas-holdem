#lang forge

open "poker.frg"

test suite for pair_win {
    example pair_win_example is {some t : Turn | Values and pair_win[t] and wellformed[t]} for {
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

    test expect {
        pair_win_is_legal: {  
            Values
            traces 
            some turn : Turn | {pair_win[turn]}
        } for exactly 4 Turn, 7 Int for {next is linear} is sat
    }

}

test suite for two_pair_win {
    example two_pair_win_example is {some t : Turn | Values and two_pair_win[t] and wellformed[t]} for {
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

    test expect {
        two_pair_win_is_legal: {  
            Values
            traces 
            some turn : Turn | {two_pair_win[turn]}
        } for exactly 4 Turn, 7 Int for {next is linear} is sat
    }
    
}
test suite for three_kind_win {
    example three_kind_win_example is {some t : Turn | Values and three_kind_win[t] and wellformed[t]} for {
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

    test expect {
        three_kind_win_is_legal: {  
            Values
            traces 
            some turn : Turn | {three_kind_win[turn]}
        } for exactly 4 Turn, 7 Int for {next is linear} is sat
    }

}

test suite for straight_win {
    example straight_win_example is {some t : Turn | Values and straight_win[t] and wellformed[t]} for {
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
        table = `Turn0 -> H9 + `Turn0 -> H8 + `Turn0 -> C7
        --Adding Cards to the Hands for this turn
        cards = `Hand0 -> D8 + `Hand0 -> S8 +
                `Hand1 -> H6 + `Hand1 -> H7 + 
                `Hand2 -> S6 + `Hand2 -> D10
    }


    test expect {
        straight_win_is_legal: {  
            Values
            traces 
            some turn : Turn | {straight_win[turn]}
        } for exactly 4 Turn, 7 Int for {next is linear} is sat
    }
}

test suite for flush_win {
    example flush_win_example is {some t : Turn | Values and flush_win[t] and wellformed[t]} for {
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
        table = `Turn0 -> HA + `Turn0 -> H10 + `Turn0 -> H3
        --Adding Cards to the Hands for this turn
        cards = `Hand0 -> D8 + `Hand0 -> S8 +
                `Hand1 -> H6 + `Hand1 -> H7 + 
                `Hand2 -> S6 + `Hand2 -> D10
    }

    test expect {
        flush_win_is_legal: {  
            Values
            traces 
            some turn : Turn | {flush_win[turn]}
        } for exactly 4 Turn, 7 Int for {next is linear} is sat
    }
}

test suite for full_house_win {
    example full_house_win_example is {some t : Turn | Values and full_house_win[t] and wellformed[t]} for {
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
        table = `Turn0 -> H9 + `Turn0 -> D8 + `Turn0 -> S8
        --Adding Cards to the Hands for this turn
        cards = `Hand0 -> C8 + `Hand0 -> D9 +
                `Hand1 -> H6 + `Hand1 -> H7 + 
                `Hand2 -> S6 + `Hand2 -> D10
    }

    test expect {
        full_house_win_is_legal: {  
            Values
            traces 
            some turn : Turn | {full_house_win[turn]}
        } for exactly 4 Turn, 7 Int for {next is linear} is sat
    }
}

test suite for four_kind_win {
    example four_kind_win_example is {some t : Turn | Values and four_kind_win[t] and wellformed[t]} for {
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
        table = `Turn0 -> HK + `Turn0 -> DK + `Turn0 -> C7
        --Adding Cards to the Hands for this turn
        cards = `Hand0 -> D8 + `Hand0 -> S8 +
                `Hand1 -> H6 + `Hand1 -> D7 + 
                `Hand2 -> SK + `Hand2 -> CK
    }


    test expect {
        four_kind_win_is_legal: {  
            Values
            traces 
            some turn : Turn | {four_kind_win[turn]}
        } for exactly 4 Turn, 7 Int for {next is linear} is sat
    }
}

test suite for straight_flush_win {
    example straight_flush_win_example is {some t : Turn | Values and straight_flush_win[t] and wellformed[t]} for {
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
        table = `Turn0 -> H10 + `Turn0 -> H9 + `Turn0 -> H8
        --Adding Cards to the Hands for this turn
        cards = `Hand0 -> D8 + `Hand0 -> S8 +
                `Hand1 -> H6 + `Hand1 -> H7 + 
                `Hand2 -> SK + `Hand2 -> CK
    }

    test expect {
        straight_flush_win_is_legal: {  
            Values
            traces 
            some turn : Turn | {striaght_flush_win[turn]}
        } for exactly 4 Turn, 7 Int for {next is linear} is sat
    }
}

test suite for royal_flush_win {
    example royal_flush_win_example is {some t : Turn | Values and royal_flush_win[t] and wellformed[t]} for {
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
        table = `Turn0 -> HQ + `Turn0 -> HJ + `Turn0 -> H10
        --Adding Cards to the Hands for this turn
        cards = `Hand0 -> D8 + `Hand0 -> S8 +
                `Hand1 -> HK + `Hand1 -> HA + 
                `Hand2 -> SK + `Hand2 -> CK
    }


    test expect {
        royal_flush_win_is_legal: {  
            Values
            traces 
            some turn : Turn | {royal_flush_win[turn]}
        } for exactly 4 Turn, 7 Int for {next is linear} is sat
    }
}


test suite for wellformed {
    example duplicates_on_table_example is {some t : Turn | Values and !wellformed[t]} for {
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
        table = `Turn0 -> HA + `Turn0 -> D2 + `Turn0 -> HA
        --Adding Cards to the Hands for this turn
        cards = `Hand0 -> D8 + `Hand0 -> S8 +
                `Hand1 -> H6 + `Hand1 -> D7 + 
                `Hand2 -> SK + `Hand2 -> CK
    }

    example overlap_betweeen_hands_example is {some t : Turn | Values and !wellformed[t]} for {
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
        table = `Turn0 -> HA + `Turn0 -> D2 + `Turn0 -> H2
        --Adding Cards to the Hands for this turn
        cards = `Hand0 -> D8 + `Hand0 -> S8 +
                `Hand1 -> H6 + `Hand1 -> D7 + 
                `Hand2 -> SK + `Hand2 -> D8
    }


}


test suite for fold_win {
    example fold_win_example is {some t : Turn | fold_win[t]} for {
        --Instance of a Turn
        Turn = `Turn0
        --Instaces of Hands
        Hand = `Hand0 + `Hand1 + `Hand2 + `Hand3
        --Adding Hands to the Turn
        hands = `Turn0 -> `Hand0 + `Turn0 -> `Hand1 + `Turn0 -> `Hand2 + `Turn0 -> `Hand3
        --Adding Cards to the folded set for this Turn
        folds = `Turn0 -> `Hand0 + `Turn0 -> `Hand1 + `Turn0 -> `Hand2
    
    }
}

test suite for fold {
    example valid_fold_example is {some pre, post : Turn | Values and fold[pre, post] and wellformed[pre] and wellformed[post]} for {
        --Instance of a Turn
        Turn = `pre + `post
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
        Hand = `Hand0 + `Hand1 + `Hand2 + `Hand3
        --Adding Hands to the Turns
        hands = `pre -> `Hand0 + `pre -> `Hand1 + `pre -> `Hand2 + `pre -> `Hand3 +
                `post -> `Hand3
        --Adding Cards to the table for the Turns
        table = `pre -> HQ + `pre -> HJ + `pre -> H10 +
                `post -> HQ + `post -> HJ + `post -> H10
        --Adding Cards to the Hands for this turn
        cards = `Hand0 -> S5 + `Hand0 -> S8 +
                `Hand1 -> H7 + `Hand1 -> H9 + 
                `Hand2 -> D8 + `Hand2 -> C3 +
                `Hand3 -> D5 + `Hand3 -> C5
        --Determining which hands should and should not be folded between pre and post
        folds = `pre -> none +
                `post -> `Hand0 + `post -> `Hand1 + `post -> `Hand2
    }

    example not_well_formed_fold_example is {some pre, post : Turn | Values and fold[pre, post] and !wellformed[pre] and !wellformed[post]} for {
        --Instance of a Turn
        Turn = `pre + `post
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
        Hand = `Hand0 + `Hand1 + `Hand2 + `Hand3
        --Adding Hands to the Turns
        hands = `pre -> `Hand0 + `pre -> `Hand1 + `pre -> `Hand2 + `pre -> `Hand3 +
                `post -> `Hand3
        --Adding Cards to the table for the Turns
        table = `pre -> HQ + `pre -> HJ + `pre -> H10 +
                `post -> HQ + `post -> HJ + `post -> H10
        --Adding Cards to the Hands for this turn
        cards = `Hand0 -> S5 + `Hand0 -> S8 +
                `Hand1 -> H7 + `Hand1 -> H9 + 
                `Hand2 -> D8 + `Hand2 -> C3 +
                `Hand3 -> D5 + `Hand3 -> D5
        --Determining which hands should and should not be folded between pre and post
        folds = `pre -> none +
                `post -> `Hand0 + `post -> `Hand1 + `post -> `Hand2
    }

    example should_have_folded_example is {some pre, post : Turn | Values and !fold[pre, post] and wellformed[pre] and wellformed[post]} for {
        --Instance of a Turn
        Turn = `pre + `post
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
        Hand = `Hand0 + `Hand1 + `Hand2 + `Hand3
        --Adding Hands to the Turns
        hands = `pre -> `Hand0 + `pre -> `Hand1 + `pre -> `Hand2 + `pre -> `Hand3 +
                `post -> `Hand3
        --Adding Cards to the table for the Turns
        table = `pre -> HQ + `pre -> HJ + `pre -> H10 +
                `post -> HQ + `post -> HJ + `post -> H10
        --Adding Cards to the Hands for this turn
        cards = `Hand0 -> S5 + `Hand0 -> S8 +
                `Hand1 -> H7 + `Hand1 -> H9 + 
                `Hand2 -> D8 + `Hand2 -> C3 +
                `Hand3 -> D5 + `Hand3 -> C2
        --Determining which hands should and should not be folded between pre and post
        folds = `pre -> none +
                `post -> `Hand0 + `post -> `Hand1 + `post -> `Hand2
    }
}

