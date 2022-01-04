module Bowling exposing (get_score)

type ScoreType = Strike | Spare | Normal 

get_score : List Int -> Int
get_score pins = 
    let 
        b1 = Maybe.withDefault 0 (List.head pins)
        b2 = Maybe.withDefault 0 (List.head <| List.drop 1 pins)
        score_type = get_score_type b1 b2
        frame_score = case score_type of 
                        Strike -> 10 + b2 + Maybe.withDefault 0 (List.head <| List.drop 2 pins) 
                        Spare -> 10 + Maybe.withDefault 0 (List.head <| List.drop 2 pins)
                        Normal -> b1 + b2 
    in 
        if List.length pins == 0 
        then 0 
        else 
            case score_type of
                Strike -> frame_score + get_score (List.drop 1 pins)  
                _ -> frame_score + get_score (List.drop 2 pins)
                

get_score_type : Int -> Int -> ScoreType
get_score_type b1 b2 = 
    if b1 == 10 then Strike else if b1 + b2 == 10 then Spare else Normal 