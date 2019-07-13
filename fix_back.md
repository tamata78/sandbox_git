# 修正内容を元に戻すコマンド

## 0.1 Gitのファイル登録状態
working Directory → Stage(Index) → History

## 0.2 戻す場合のコマンド概要
History → Stage(Index): git reset -- files
Stage(Index) → workingDir: git checkout -- files

#  1. リポジトリの状態確認する
```git
git log
git statuts
git diff
```

# 2. working Directoryファイル

## 2.1 ファイル変更を元に戻す
```git
git checkout . # カレントディレクトリ以下をすべて元に戻す。新規作成ファイルは残る。
gti checkout file # 指定ファイルを元に戻す 
```

## 2.2 新規ファイルを含めて、すべての変更を元に戻す
対象ファイルを指定しないとすべての変更が元に戻るので注意
```git
# 対象ファイルを念のため確認
git clean -n

# 削除実行
git clean -f ＜対象ファイル＞
```

# 3. Stageファイル
```git
git reset . # commit,indexを削除、修正内容は残る
git reset --hard @ # 前回のコミット時点に戻す
git reset --hard @^ # 一つ前のコミット時点に戻す
git reset --hard [該当コミットのハッシュ値] # 指定コミットに戻す
git checkout [該当コミットのハッシュ値] 元に戻すファイルパス # git reset --hardと同じ動作。こっちの方が安全
git reset --soft # commitを削除、indexと修正内容は残る
```
オプションなしは--mixedと同等。HEADの位置とインデックスを変更する  
該当コミットのハッシュ値はreflogやlogから調査可能

## 3.1 抹消されたログでもreflogには存在。一度記録したことなら戻せる
```
$ git reset --hard HEAD^^ # 戻しすぎた
$ git reflog
888f5cb HEAD@{0}: head^^: updating HEAD
073b0b8 HEAD@{1}: merge @{-1}: Merge made by the 'recursive' strategy.
$ git reset --hard HEAD@{1} # reset --hard HEAD^^する前に戻れる
```

# 4. push済みファイル

## 4.1 ローカル履歴を削除して、pushし直す
```
git reset --hard @^ # 直前のコミットを取り消す
git push -f origin master # 強制的にPushする
```

## 4.2 ローカル履歴は残して、push操作だけ取り消す
```
git push -f origin 8dj2dg:master # 引数は「<ローカルのコミット>:<リモートの参照>」。リモートのmaster を8dj2dg に強制
```
