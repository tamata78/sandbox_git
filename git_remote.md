# remote

## 追加
```
$ git remote add [追加するリモートリポジトリ名] [追加したいリポジトリ]
$ git remote add origin http://xxxxxx.xxx/xxxx

## 追加後はpushを以下のように実行できる
$ git push [作成したリポジトリ名] [ブランチ名]
```

# 一覧表示
```
$ git remote -v
origin    https://xxxxxx.xxx/xxxxx (fetch)
origin    https://xxxxxx.xxx/xxxxx (push)
```

# 削除
$ git remote rm [削除したいリモートリポジトリ名]

# 変更
```
$ git remote set-url origin [変更先のURL] # URL
$ git remote rename [変更前リポジトリ名] [変更後リポジトリ名] #リポジトリ名
```
