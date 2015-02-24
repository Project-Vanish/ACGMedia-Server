# ACGMedia-Server
*「ACG Media」服务端*

该程序基于 Node.JS / Redis，用于「ACG Media」的数据储存、ACGMedia-Cache 的缓存数据源，以及提供直接的语录获取功能。


----------


##客户端 API

####获取一条语录

**接口地址**

> http://acgmedia.ant.moe/api/getSingleQuotation

**请求方式** GET

**请求参数**

`dataType` 返回结果类型 [可选，默认JSON，可选择 text（UTF-8 纯文本）]

`qid` 语录ID [可选：若为空则返回随机语录]

`category_id` 语录类别ID [可选：若为空则选择所有分类]

`form_id` 来自作品ID [可选：若为空则选择所有出处]

**JSON返回结果示例**
```
{
  isok: 1,
  text: '或许前路永夜，即便如此我也要前进，因为星光即使微弱也会为我照亮前途。',
  qid: 132,
  type: 'Quotation',
  category: '醍醐灌顶'
  category_id: 3,
  from: '《四月是你的谎言》',
  from_id: 13
}
//错误示例
{
  err: 101,
  text: 'Invalid QID!',
  isok: 0
}
```

----------


###获得指定条件的所有语录

**接口地址**

> http://acgmedia.ant.moe/api/getQuotations

**请求方式** GET

**请求参数**

（支持多值匹配，请使用英文半角逗号连接）

`category_id` 语录类别ID

`form_id` 来自作品ID

`dataType` 返回结果类型 [可选，默认json（JSON数组），可选择 string（String数组，UTF-8 纯文本）]

**JSON数组返回结果示例**

```
[{
  text: '或许前路永夜，即便如此我也要前进，因为星光即使微弱也会为我照亮前途。',
  qid: 132,
  type: 'Quotation',
  category: '醍醐灌顶'
  category_id: [2,3],
  from: '《四月是你的谎言》',
  from_id: 13
},{
  text: '莫扎特曾经说过大胆地踏上旅途吧，我不知道路途的前方究竟有什么，但是，我们还是迈出了步伐，我们仍在旅途之中。',
  qid: 133,
  type: 'Quotation',
  category: '醍醐灌顶'
  category_id: [2,3],
  from: '《四月是你的谎言》',
  from_id: 13
}]
//为空示例
[]
//其他错误示例
{
  err: 102,
  text: 'Invalid Request!'
}
```

**String数组返回结果示例**

```
['或许前路永夜，即便如此我也要前进，因为星光即使微弱也会为我照亮前途。',
 '莫扎特曾经说过大胆地踏上旅途吧，我不知道路途的前方究竟有什么，但是，我们还是迈出了步伐，我们仍在旅途之中。']
//为空示例
[]
//其他错误示例
{
  err: 102,
  text: 'Invalid Request!'
}
```

##Redis 数据库的设计


**QID->单条语录**

    get quotation:`[id]`
    Result: 2,3;13;5oiW6K645YmN6Lev5rC45aSc77yM5Y2z5L6/5aaC5q2k5oiR5Lmf6KaB5YmN6L+b77yM5Zug5Li65pif5YWJ5Y2z5L2/5b6u5byx5Lmf5Lya5Li65oiR54Wn5Lqu5YmN6YCU44CC //第一个分类ID,第二个分类ID;出处ID;语录正文Base64

**语录分类ID->QID**

    smembers quotation:category:2
    Result: 1,7,...,133,...

**语录出处ID->QID**

    smembers quotation:from:13
    Result: 64,...,133,...

**语录正文MD5->QID**

    hget quotation:text f72b00a56a403e0f152e67818be96826
    Result: 133

**语录分类ID->语录分类中文名**

    get quotation:category:2:name
    Result：醍醐灌顶

**语录出处ID->语录出处中文名**

    get quotation:from:2:name
    Result: 《四月是你的谎言》

**语录分类中文名MD5->语录分类ID**

    hget quotation:category 2ab2d2105778f0a57d7e1bfd8f3724cb
    Result: 3

**语录出处中文名MD5->语录出处ID**

    hget quotation:from 916a65ea2ebf41f2ba916b820bc1315e
    Result: 13


##贡献者

Project-Vanish / Plutonist (wspl/Plutonium/plqws)


##License

MIT