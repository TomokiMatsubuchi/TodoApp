## Flutterの使い方

### デバイス確認
```bash
flutter devices
```

### 各デバイス毎の起動方法
```bash
flutter run -d your_device_id
```

### flutterのビルドキャッシュの削除
※主にiosでホットリロードが効かなくなった時に実行する

```bash
flutter clean
flutter pub get
flutter run
```
