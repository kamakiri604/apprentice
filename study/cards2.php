<?php

require_once("tramp2.php");

echo "戦争を開始します。" . PHP_EOL;

echo "カードが配られました。" . PHP_EOL;

while (true) {

    if (count($player1) === 0) {
        shuffle($player1Sub);
        $player1 = $player1Sub;
        $player1Sub = [];
    } 
    
    if (count($player2) === 0) {
        shuffle($player2Sub);
        $player2 = $player2Sub;
        $player2Sub = [];
    }

    if (count($player1) === 0 && count($player1Sub) === 0) {
    echo "プレイヤー１の手札がなくなりました。" . PHP_EOL;
    echo "プレイヤー２の手札は５２枚です。 プレイヤー１の手札は０枚です" . PHP_EOL;
    echo "プレイヤー２が１位、プレイヤー１が２位です。" . PHP_EOL;
    echo "戦争を終了します。";
    break;
    } elseif (count($player2) === 0 && count($player2Sub) === 0) {
    echo "プレイヤー２の手札がなくなりました。" . PHP_EOL;
    echo "プレイヤー１の手札は５２枚です。 プレイヤー２の手札は０枚です" . PHP_EOL;
    echo "プレイヤー１が１位、プレイヤー２が２位です。" . PHP_EOL;
    echo "戦争を終了します。";
    break;
    }

    $show1 = array_pop($player1);
    $show2 = array_pop($player2);

    echo "戦争！" . PHP_EOL;
    echo "プレイヤー１のカードは".$show1."です" . PHP_EOL;
    echo "プレイヤー２のカードは".$show2."です" . PHP_EOL;

    list($pattern1, $number1) = explode("の",$show1);
    list($pattern2, $number2) = explode("の",$show2);
    
    $strength1 = $strength[$number1];
    $strength2 = $strength[$number2];
    
    if($strength1 > $strength2) {
        echo "プレイヤー１が勝ちました。 プレイヤー１はカードを２枚もらいました。" . PHP_EOL;
        $player1Sub[] = $show1;
        $player1Sub[] = $show2;
    } elseif($strength1 < $strength2) {
        echo "プレイヤー２が勝ちました。 プレイヤー２はカードを２枚もらいました。" . PHP_EOL;
        $player2Sub[] = $show1;
        $player2Sub[] = $show2;
    } elseif($strength1 == $strength2) {
        echo "引き分けです。" . PHP_EOL;
    }
}