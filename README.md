# 画像編集アプリ

この Flutter プロジェクトは、シンプルな画像編集アプリケーションです。

![GIF 2024-08-16 10-30-17](https://github.com/user-attachments/assets/c461ac91-d48c-4e96-b109-aae1a276ead8)

## Download / View
- ### [Android apk file](https://raw.githubusercontent.com/check5004/iamge_drawing_test/main/release/Android/app-release.apk)

  ![QR_776168](https://github.com/user-attachments/assets/a06dcf90-5b47-4d0e-92d1-6d00a970662c)

- ### [Web（動作不良）](https://check5004.github.io/iamge_drawing_test/)

  ![QR_776291](https://github.com/user-attachments/assets/3216a541-65c4-408c-870d-9ffe423b86d3)

---

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
