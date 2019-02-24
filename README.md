# README

* 東京都府中市の粗大ゴミ料金表を検索してシール代金を表示するアプリです

## イメージ
[![Image from Gyazo](https://i.gyazo.com/4b67298239906ceb53d5aa9d4e98f8a4.gif)](https://gyazo.com/4b67298239906ceb53d5aa9d4e98f8a4)

## 環境
* Ruby version 2.6.1
* Rails version 6.0.0 beta 1
* Algolia Search API

## 開発環境構築
### API取得
* Algolia search APIを取得し、 `.env` に記入してください。（ `.sample.env` を参照ください。）
* （importをする場合）Yahoo Japan developer APIを取得し `.env` に記入してください。

### docker起動

```
docker-compose build
docker-compose up -d
```

終了は

```
docker-compose down
```

### import
* [府中市HP](https://www.city.fuchu.tokyo.jp/kurashi/gomirisaikuru/dashikata/sodaigomidasikata.html)より 「粗大ごみの料金表」のCSVをダウンロードしてください

```
docker-compose exec web rake db:import['粗大ゴミの料金表.csv','2019-01-05']
```

### index作成

```
docker-compose exec web rails c
> Trash.reindex
```

