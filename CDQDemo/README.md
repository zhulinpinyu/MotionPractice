CDQDemo
===================
0. cdq init

> 创建并编辑 schemas/0001_initial.rb

1. rake schema:build

> build 已创建的schema

2. cdq create model store

> 生成名称为的model


```zsh
在app_delegate.rb 中`include CDQ`

并且添加 `cdq.setup` 在application方法中
```

REF: [https://github.com/infinitered/cdq/wiki/Greenfield-Quick-Start](https://github.com/infinitered/cdq/wiki/Greenfield-Quick-Start)
