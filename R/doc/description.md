`DESCRIPTION`ファイルは、パッケージのタイトル、概要やバージョン情報などを記載するファイルです。

このファイルに記載したパッケージ名や概要などは、パッケージのインデックスページに転記されます。

`R`コードで使用されているパッケージは、このファイルに記載します。
上記のコードでは、通常のRスクリプトでパッケージを読み込む際に書く`library({パッケージ名})`がありません。

`DESCRIPTION`ファイルは、`項目名: 内容`という形式で書きます。
様々な項目が用意されていますが、以下では必要最小限の項目のみ説明しています。
（https://cran.r-project.org/doc/manuals/R-exts.html#The-DESCRIPTION-file に詳しい説明があるが、あまりまとまっていなくて読みづらい...）


| 項目名 | 概要 | 必要性 |
|--------|:-----|:-------| 
| `Package` | パッケージ名（英数字およびドットが使用可）。パッケージの説明は`Package`や`Title`ではなく`Description`に記載すべし | **必須** |
| `Version` | ドットあるいはハイフン区切りの３桁あるいは２桁からなる数値によるバージョン表記。下記でも説明 | **必須** |
| `License` | ライセンス | **必須** |
| `Title` | 簡単なパッケージの説明。単語は大文字にする（いわゆるcapitalization rules） | **必須** |
| `Description` | パッケージの概要を細かく記載。 | **必須** |
| `Authors@R`| `person()`を使用した作成者の表記 | 必須？ |
| `Author` | パッケージ作成者。複数人いる場合はそれぞれの役割を記載すると良い | **必須** |
| `Maintainer` | パッケージの代表管理者（一人）。名前のあとにメールアドレスを記載する。`bug.report()`を使用したバグ報告にはこのアドレスが使用される？| **必須** |
| `Depends` | パッケージが依存しているR本体のバージョンやパッケージ | 任意 |
| `Imports` | このパッケージ本体が明示的に依存している（関数やデータセットを使用する）パッケージ | 任意 |
| `Suggests` | パッケージ内で使用しないが、testやvignettesで使うパッケージ | 任意 |
| `BugReports` | Maintainerへのバグ報告の代わりとして、用意されているバグ報告先。GitHubのissuesへのリンクがしばしば利用される | 任意 |
| `URL` | 適宜参照してほしいURL。複数ある場合にはカンマかスペースで区切って記載する | 任意 |
| `LazyData` | 遅延評価をおこなうがどうかを真偽値で記載 | 任意 |
| `VignetteBuilder` | vignettesのビルド方法（例. `knitr`） | 任意 |
| `Copyright` | 著作権の所持者 | 任意 |
| `Date` | リリースした日付。`YYYY-MM-DD`表記 | 任意 |