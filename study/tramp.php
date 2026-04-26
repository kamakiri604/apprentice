<?php

#トランプの要素の配列を用意#
$patterns = ["スペード","ダイヤ","ハート","クラブ"];
$numbers = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"];

#山札を生成してシャッフル#
$cards = [];
foreach($patterns as $pattern) {
    foreach($numbers as $number) {
        $cards[] = $pattern."の".$number;
    }
}
shuffle($cards);

#山札から二人にカードがなくなるまで一枚ずつ配る#
$player1 = [];
$player2 = [];
$turn = 0;
while(count($cards) > 0) {
    if($turn % 2 === 0) {
        $player1[] = array_pop($cards);
    } else {
        $player2[] = array_pop($cards);
    }
    $turn++;
}

#手札から一枚ずつ出す処理#


#カードの強さを定義する#
$strength = [
    "2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,
    "7"=>7,"8"=>8,"9"=>9,"10"=>10,
    "J"=>11,"Q"=>12,"K"=>13,"A"=>14
];

#柄と数字で分けて数字だけを読み込ませる#



