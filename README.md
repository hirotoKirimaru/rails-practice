# RoRを素振りするためのもの



# 環境構築

- Qiita
    - https://qiita.com/kodai_0122/items/795438d738386c2c1966
- Docker Docs
    - https://docs.docker.com/samples/rails/
- Railsチュートリアル
    - https://railstutorial.jp/chapters/beginning?version=5.1



- heroku
    - git
        - https://git.heroku.com/mysterious-lowlands-42932.git
    - page
        - https://mysterious-lowlands-42932.herokuapp.com/

# herokuへのデプロイができない
https://railstutorial.jp/chapters/beginning?version=5.1#cha-beginning

```bash
# branchはmainなので.not master.
git push heroku main

# デフォルトバンドル？
heroku buildpacks:set heroku/ruby

```