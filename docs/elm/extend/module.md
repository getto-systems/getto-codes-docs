# モジュールの配置方法

- App : Page モジュールを配置
- Layout : Page モジュールから参照される Layout モジュール
- Command : Cmd を発行するモジュールを配置
- View : 全体で使用する Model を定義
- Html : Html を生成するモジュールを配置

## import 順

1. Version
1. Env
1. View, Href
1. Command
1. Html
1. I18n

自分よりも大きい番号に属する module は import してはならない。

App, Layout については Href, View, Html は上記の順序、これ以外は I18n と同じレベルで扱う。


## View

全体で使用する Model の場合はここに定義する。

基本的に Page 間での Model の共有は行わない。
一部の Page 間で共有したい場合は、本質的に同一かを考え直すこと。
Frontend の性質上、大抵の場合はその Page のみで使用するもののはず。


## Command

Cmd を発行するモジュールは Command にそれぞれ分離して配置する。
Layout/Frame に Transition を発行する関数を定義してこれを呼び出すようにする。


## 特殊モジュール

- Version : リリース時に自動で書き換わる
- Env : bin/prepare-{development|production}.sh で書き換わる
