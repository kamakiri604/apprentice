<?php

require_once("cardsClass.php");

echo "戦争を開始します。" . PHP_EOL;

$deck = new Deck();

$player1 = new Player();
$player2 = new Player();
$player1Sub = new Player();
$player2Sub = new Player();

$turn = 0;
while($deck->count() > 0) {
    if($turn % 2 === 0) {
        $player1->add($deck->draw());
    } else {
        $player2->add($deck->draw());
    }
    $turn++;
}

echo "カードが配られました。" . PHP_EOL;

while (true) {

    if ($player1->count() === 0) {
        $player1Sub->shuffle();
        $player1 = $player1Sub;
        $player1Sub = new Player();
    } 
    
    if ($player2->count() === 0) {
        $player2Sub->shuffle();
        $player2 = $player2Sub;
        $player2Sub = new Player();
    }

    if ($player1->count() === 0 && $player1Sub->count() === 0) {
    echo "プレイヤー１の手札がなくなりました。" . PHP_EOL;
    echo "プレイヤー２の手札は５２枚です。 プレイヤー１の手札は０枚です" . PHP_EOL;
    echo "プレイヤー２が１位、プレイヤー１が２位です。" . PHP_EOL;
    echo "戦争を終了します。";
    break;
    } elseif ($player2->count() === 0 && $player2Sub->count() === 0) {
    echo "プレイヤー２の手札がなくなりました。" . PHP_EOL;
    echo "プレイヤー１の手札は５２枚です。 プレイヤー２の手札は０枚です" . PHP_EOL;
    echo "プレイヤー１が１位、プレイヤー２が２位です。" . PHP_EOL;
    echo "戦争を終了します。";
    break;
    }

    $card1 = $player1->draw();
    $card2 = $player2->draw();

    echo "戦争！" . PHP_EOL;
    echo "プレイヤー１のカードは".$card1->show()."です" . PHP_EOL;
    echo "プレイヤー２のカードは".$card2->show()."です" . PHP_EOL;
    
    $strength1 = $strength[$card1->getNumber()];
    $strength2 = $strength[$card2->getNumber()];
    
    if($strength1 > $strength2) {
        echo "プレイヤー１が勝ちました。 プレイヤー１はカードを２枚もらいました。" . PHP_EOL;
        $player1Sub->add($card1);
        $player1Sub->add($card2);
    } elseif($strength1 < $strength2) {
        echo "プレイヤー２が勝ちました。 プレイヤー２はカードを２枚もらいました。" . PHP_EOL;
        $player2Sub->add($card1);
        $player2Sub->add($card2);
    } elseif($strength1 == $strength2) {
        echo "引き分けです。" . PHP_EOL;
    }
}