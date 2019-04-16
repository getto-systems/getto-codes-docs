# Document を作成する

## ディレクトリ構成

- docs/docs : Docs のドキュメント
- docs/elm : Elm のドキュメント


## lint と statistics

```bash
$ npm start
```

編集したファイルの lint とそれに伴って変更した全体の statistics を README.md に書き込む。


### lint の基準

以下を目的に lint を設定した。

- Document を書きやすくする
- Document を読みやすくする

具体的な項目は以下の通り。

- 全体のファイル数は少ない方が良い
- ページあたりの文字数は少ない方が良い
- ページの階層は少ない方が良い
