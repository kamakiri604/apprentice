インターネットTVサービスのデータベースの作成手順

1,テーブル作成のためのテーブル候補を洗い出す
- channels (チャンネル名を管理するテーブル)
- programs (番組情報を管理するテーブル)
- seasons (シーズン情報を管理するテーブル)
- episodes (エピソード情報を管理するテーブル)
- broadcasts (放送情報を管理するテーブル)
- broadcast_slots (放送枠情報を管理するテーブル)
- genres (ジャンル情報を管理するテーブル)
- program_genres (番組とジャンルの関係を管理するテーブル)
この８個のテーブルを作成する
* 重要ポイント
- シーズンごとのエピソード持たせる必要があるので、シーズンとエピソードのテーブルを分ける
- 再放送もあるため、ある番組が複数チャンネルの異なる番組枠で放映されることはある。この仕様を満たすために、番組とチャンネルの関係を管理するテーブルを作成する必要がある

2,テーブルの構造を定義する
- channels (id(primary key), name)
- programs (id(primary key), name, description)
- seasons (id(primary key), program_id(foreign key), season_number)
- episodes (id(primary key), program_id(foreign key), season_id(foreign key), episode_number, title, e_details, time, release_date)
- broadcasts (id(primary key), broadcast_slot_id(foreign key), episode_id(foreign key), viewers)
- broadcast_slots (id(primary key), channel_id(foreign key), start_time, end_time)
- genres (id(primary key), name)
- program_genres (program_id(foreign key), genre_id(foreign key))
* 重要ポイント
- 一つのテーブルに一つの主キーを設定する
- 外部キーを適切に設定することで、テーブル間の関係を明確にする

