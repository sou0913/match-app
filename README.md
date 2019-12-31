# Railsを用いたマッチングアプリの制作
</br>
<a href="https://gyazo.com/7e071924eb181df9d0cd69c7d32931d0"><img src="https://i.gyazo.com/7e071924eb181df9d0cd69c7d32931d0.png" alt="Image from Gyazo" width="400"/></a>
</br>  

## 概要

- いいね機能、検索機能、メッセージ機能を備えたマッチングアプリを作成

## 目的

- Ruby on RailsによるWebアプリ開発のスキルの向上
- Docker,ECS,Terraform,CircleCIを用いた開発環境の構築スキルの向上
- jQuery、Materializeなどフレームワークを用いたマークアップスキルの向上

## 使用技術

Ruby2.5.1  
Ruby on Rails 5.2.3    
HTML、Sass  
jQuery  
AWS(ECS、ECR、RDS、ElastiCache、S3、Route53、ACM)  
Terraform、CircleCI


## コンセプト

- コンセプトは、「洋楽器（バイオリンなど）演奏者」と「和楽器演奏者」のマッチングサービスです。
- 自身が三味線を演奏していた頃、洋楽器とのセッションがもっと気軽にできるようになればなと考えていたことがきっかけです。

## 機能

- いいねをする、いいねをされる、マッチングする。
- マッチングした相手とメッセージの交換をする。
- ユーザーを検索する。
- プロフィールを公開、編集する。

## 構成図
<a href="https://gyazo.com/88a507f2dba614129ba91cb503a86022"><img src="https://i.gyazo.com/88a507f2dba614129ba91cb503a86022.png" alt="Image from Gyazo" width="600"/></a>
</br>
- なお、12/31より費用削減のため、ElastiCacheを使わず、Dockerコンテナ内でRedisを立ち上げています。
