
### Webビルドの実行

```bash
flutter build web --base-href "/iamge_drawing_test/"
```

### ビルドファイルのコピー

```bash
cp -r -Force build/web/* release/web/
```

### 変更のコミット

```bash
git commit -m "Update GitHub Pages"
```

### gh-pagesブランチの作成

```bash
git subtree split --prefix=release/web -b gh-pages
```

### gh-pagesブランチのプッシュ

```bash
git push -f origin gh-pages
```