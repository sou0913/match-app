# Railsを用いたマッチングアプリの制作

## 概要

- いいね機能、検索機能、メッセージ機能を備えたマッチングアプリを作成

## 目的

- TECH::EXPERTで学んだRuby on Railsの復習

## 動作環境

ruby2.5.1
rails 5.2.3

## 使用技術

- Ruby on Railsを用いました。
- マークアップには、フレームワークMaterializeを使用しました。

## 機能について

- マッチングアプリ上のユーザーは、一般に、定められた二つの属性のうちいずれかを持ちます。企業と学生団体をマッチングさせるというコンセプトで作りました。そのため、新規登録時、「企業」か「団体」かのどちらか片方を選べます。

[![Image from Gyazo](https://i.gyazo.com/8c7c7ee96b180746d690bdda172e8ec6.gif)](https://gyazo.com/8c7c7ee96b180746d690bdda172e8ec6)


- いいねをした状態、いいねをされた状態、マッチング状態の3状態を表現しました。

[![Image from Gyazo](https://i.gyazo.com/50c062520210ec80df331d770845f5d4.gif)](https://gyazo.com/50c062520210ec80df331d770845f5d4)


- レスポンシブデザインを取り入れ、スマートフォンでも快適に使えるインターフェイスとなっています。

[![Image from Gyazo](https://i.gyazo.com/a023684ec55907c18c935f0787dc09f1.gif)](https://gyazo.com/a023684ec55907c18c935f0787dc09f1)


- メッセージを送信すると非同期通信が行われ、自分、相手のブラウザに表示されます。

[![Image from Gyazo](https://i.gyazo.com/bbf71985c38a75d23afe92509422c3ae.gif)](https://gyazo.com/bbf71985c38a75d23afe92509422c3ae)


- 求める条件のユーザーを検索することが出来ます。

[![Image from Gyazo](https://i.gyazo.com/9569400dfa40012a0bc4137242e33fa7.gif)](https://gyazo.com/9569400dfa40012a0bc4137242e33fa7)

## 制作して良かったこと
- Ruby on Railsを用いたアプリ作成の全体像を把握できた。
- Materializeを用いたインターフェイスの実装を学べました。
  
