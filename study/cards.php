<?php

require_once("tramp.php");

echo "戦争を開始します。" . PHP_EOL;

echo "カードが配られました。" . PHP_EOL;

echo "戦争！" . PHP_EOL;

while(count($player1) > 0 && count($player2) > 0) {
    
    $show1 = array_pop($player1);
    $show2 = array_pop($player2);

    echo "プレイヤー１のカードは".$show1."です" . PHP_EOL;
    echo "プレイヤー２のカードは".$show2."です" . PHP_EOL;

    list($pattern1, $number1) = explode("の",$show1);
    list($pattern2, $number2) = explode("の",$show2);
    
    $strength1 = $strength[$number1];
    $strength2 = $strength[$number2];
    
    if($strength1 > $strength2) {
        echo "プレイヤー１が勝ちました。" . PHP_EOL;
        echo "戦争を終了します。" . PHP_EOL;
        break;
    } elseif($strength1 < $strength2) {
        echo "プレイヤー２が勝ちました。" . PHP_EOL;
        echo "戦争を終了します。" . PHP_EOL;
        break;
    } elseif($strength1 == $strength2) {
        echo "引き分けです。" . PHP_EOL;
        echo "戦争" . PHP_EOL;
    }
}