# Page を作成する

## トップ構造

- App/Menu.elm : メニュー
- App/I18n.elm : ページタイトル


## Page のコピー

`path/to/content.html` なら `App/Path/To/Content` に Page モジュールをコピーする。

```bash
$ cp -a App/Data/Upload/List App/Path/To/Content
```

コピー元は既存のページから選ぶ。

- App/Data/Upload/List : 検索
- App/Data/Upload/ListEdit : リストでの編集
- App/Data/Upload/Edit : 編集
- App/Data/Upload/New : 新規登録


### Href, I18n

- App/Path/To/Href : リンクを定義
- App/Path/To/I18n : テキストを定義


## Page の構成

- Page : ページ本体
- Model : Model の定義
- Search, Info, Detail, etc. : ページモジュールの定義
- Search/View : Search で使用する Model の定義
- Search/Html : Search で使用する Html の定義
- Data : 複数のページモジュールで同じデータを使用する場合は Data と Data/View で行う
