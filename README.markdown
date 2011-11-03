# A Rails UI branching model

## これは何？
RailsのUIに関するコードをブランチで管理し、UIの切り替えを容易に行えるようにする仕組み。

実運用で使用できるか、調査中。

## 仕組み
RailsのUIに関する下記フォルダをシンボリックリンクに変更し、一つのフォルダに集める。

* app/assets
* app/views
* public

RailsのUIに関するコードを集約したディレクトリ(このプロジェクトでは"\_ui/")をgit submoduleを使い、ブランチ化する。

### git submodule
一般的に外部のリポジトリを自分のプロジェクトで使う際に使用する。

このプロジェクトでは自分のプロジェクトのブランチをディレクトリとして扱うために使用しています。

### post-checkout
*実装予定*

親プロジェクトでcheckoutを実行した時、各submoduleのsha-1も同時に変更する。

### post-commit
\_ui/ に変更がある場合、親プロジェクトでコミットをすると、\_ui/でも同じコミットメッセージでコミットを行います。
また、コミット後に.gitmoduleを更新します。

## 使い方
動作確認は Ubuntu 11.04とgit 1.7.4.1でしています。

master\_readonlyブランチで、試すことができます。

    $ git clone git://github.com/sinsoku/rails-ui-br.git
    $ cd rails-ui-br
    $ git checkout -t origin/master_readonly
    $ ./set_devenv.sh

pushはできませんが、動作は分かると思います。


## 既知の問題

### git checkout
submoduleを含むプロジェクトでgit checkoutを行うとsubmoduleのsha-1は変わらないため、.gitmoduleとズレが発生する。

*上述したpost-checkoutで対応予定*
