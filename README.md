# 画像編集アプリ

この Flutter プロジェクトは、シンプルな画像編集アプリケーションです。

![アプリのデモ動画](https://drive.google.com/file/d/1vQYjZzTy7GdkCdHXatXRzSDRow4Byn4S/preview)

## 機能

- カメラまたはギャラリーから画像を選択
- 画像の編集（フィルター適用、切り抜き、回転など）
- 編集した画像の保存

## 始め方

1. このリポジトリをクローンします。
2. `flutter pub get` を実行して依存関係をインストールします。
3. `flutter run` でアプリを起動します。

## 使用している主なパッケージ

- image_editor_plus: 画像編集機能
- image_picker: カメラやギャラリーからの画像選択
- permission_handler: 権限の管理
- file_saver: ファイル保存（Web 用）
- image_gallery_saver: 画像ギャラリーへの保存（モバイル用）

## 注意事項

- iOS、Android、Web プラットフォームに対応しています。
- 各プラットフォームの権限設定が適切に行われていることを確認してください。

詳細な使用方法や貢献方法については、プロジェクトのドキュメンテーションを参照してください。
