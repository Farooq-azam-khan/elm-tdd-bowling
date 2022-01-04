module BowlingTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)

import Bowling exposing (get_score)

suite : Test
suite =
    describe "Bowling score calculation"
    [ testGame "All Gutter Frames" 0 [0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0]
    , testGame "Knock down 1 pin" 1 [1,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0]
    , testGame "1 Spare" 10 [5,5, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0]
    , testGame "1 Spare followed by a 3" 16 [5,5, 3,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0]
    , testGame "1 Strike" 10 [10, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0]
    , testGame "1 Strike followed by 3 and 3" 22 [10, 3,3, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0]
    , testGame "Perfect Game" 300 [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
    ]

testGame : String -> Int -> List Int -> Test
testGame msg expected input = 
    test msg <| 
        \_ -> Expect.equal (get_score input) expected