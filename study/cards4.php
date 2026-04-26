<?php

echo "戦争を開始します。" . PHP_EOL;

$strength = [
    "2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,
    "7"=>7,"8"=>8,"9"=>9,"10"=>10,
    "J"=>11,"Q"=>12,"K"=>13,"A"=>14
];

$patterns = ["スペード","ダイヤ","ハート","クラブ"];
$numbers = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"];

$cards = [];

foreach ($patterns as $pattern) {
    foreach ($numbers as $number) {
        $cards[] = $pattern . "の" . $number;
    }
}

shuffle($cards);

echo "プレイヤーの人数を入力してください (2~5): ";
$playerNumber = (int)trim(fgets(STDIN));

$players = [];

for ($i = 0; $i < $playerNumber; $i++) {
    echo "プレイヤー" . ($i + 1) . "の名前を入力してください: ";
    $playerName = trim(fgets(STDIN));

    $players[$i] = [
        "name" => $playerName,
        "cards" => [],
        "subCards" => []
    ];
}

$turn = 0;

while (count($cards) > 0) {
    $players[$turn % $playerNumber]["cards"][] = array_pop($cards);
    $turn++;
}

echo "カードが配られました。" . PHP_EOL;

while (true) {

    foreach ($players as $i => $player) {
        if (count($players[$i]["cards"]) === 0 && count($players[$i]["subCards"]) > 0) {
            shuffle($players[$i]["subCards"]);
            $players[$i]["cards"] = $players[$i]["subCards"];
            $players[$i]["subCards"] = [];
        }
    }

    foreach ($players as $player) {
        if (count($player["cards"]) === 0 && count($player["subCards"]) === 0) {
            echo $player["name"] . "の手札がなくなりました。" . PHP_EOL;

            usort($players, function($a, $b) {
                $aCount = count($a["cards"]) + count($a["subCards"]);
                $bCount = count($b["cards"]) + count($b["subCards"]);
                return $bCount - $aCount;
            });

            foreach ($players as $index => $p) {
                $count = count($p["cards"]) + count($p["subCards"]);
                echo $p["name"] . "の手札の枚数は" . $count . "枚です。" . PHP_EOL;
                echo $p["name"] . "が" . ($index + 1) . "位です。" . PHP_EOL;
            }

            echo "戦争を終了します。" . PHP_EOL;
            break 2;
        }
    }

    echo "戦争！" . PHP_EOL;

    $battleCards = [];

    foreach ($players as $i => $player) {
        $show = array_pop($players[$i]["cards"]);

        echo $players[$i]["name"] . "のカードは" . $show . "です" . PHP_EOL;

        list($pattern, $number) = explode("の", $show);

        $battleCards[] = [
            "playerIndex" => $i,
            "card" => $show,
            "strength" => $strength[$number]
        ];
    }

    $maxStrength = 0;

    foreach ($battleCards as $battleCard) {
        if ($battleCard["strength"] > $maxStrength) {
            $maxStrength = $battleCard["strength"];
        }
    }

    $winners = [];

    foreach ($battleCards as $battleCard) {
        if ($battleCard["strength"] === $maxStrength) {
            $winners[] = $battleCard["playerIndex"];
        }
    }

    if (count($winners) === 1) {
        $winnerIndex = $winners[0];

        echo $players[$winnerIndex]["name"] . "が勝ちました。" . PHP_EOL;
        echo $players[$winnerIndex]["name"] . "はカードを" . count($battleCards) . "枚もらいました。" . PHP_EOL;

        foreach ($battleCards as $battleCard) {
            $players[$winnerIndex]["subCards"][] = $battleCard["card"];
        }

    } else {
        echo "引き分けです。" . PHP_EOL;

        foreach ($battleCards as $battleCard) {
            $players[$battleCard["playerIndex"]]["subCards"][] = $battleCard["card"];
        }
    }

    echo PHP_EOL;
}