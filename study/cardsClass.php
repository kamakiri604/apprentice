<?php

#トランプを定義#
class Card {
    private $pattern;
    private $number;
    public function __construct($pattern,$number) {
        $this->pattern = $pattern;
        $this->number = $number;
    }
    public function getNumber() {
        return $this->number;
    }
    public function show() {
        return $this->pattern."の".$this->number;
    }
}

class Player {
    private $cards = [];
    public function draw() {
        return array_pop($this->cards);
    }
    public function add($cards) {
        $this->cards[] = $cards;
    }
    public function count() {
        return count($this->cards);
    }
    public function shuffle() {
        shuffle($this->cards);
    }
}

class Deck {
    private $cards = [];
    public function __construct() {
        $patterns = ["スペード","ダイヤ","ハート","クラブ"];
        $numbers = ["A","K","Q","J","10","9","8","7","6","5","4","3","2"];
        foreach($patterns as $pattern) {
            foreach($numbers as $number) {
                $this->cards[] = new Card($pattern,$number);
            }
        }
    shuffle($this->cards);
    }
    public function draw() {
        return array_pop($this->cards);
    }
    public function count() {
        return count($this->cards);
    }
}

$strength = [
    "2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,
    "7"=>7,"8"=>8,"9"=>9,"10"=>10,
    "J"=>11,"Q"=>12,"K"=>13,"A"=>14
];