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
  ok: 1,
  text: '或许前路永夜，即便如此我也要前进，因为星光即使微弱也会为我照亮前途。',
  qid: 132,
  type: 'Quotation',
  category: '醍醐灌顶'
  category_id: 3,
  from: '《四月是你的谎言》',
  from_id: 13
}
//结果为空示例
{
  err: 'No Results!'
}
//其他错误示例
{
  err: 'Invalid dataType!'
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
  err: 'Invalid dataType!'
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
  err: 'Invalid dataType!'
}
```

##Redis 数据库的设计


**单条语录 - JSON**

    get quotation:`[id]`
    Result: 2,3;13 //第一个分类ID,第二个分类ID;出处ID

**语录分类**

    smembers quotation:category:2
    Result: 1,7,...,133,...

**语录出处**

    smembers quotation:from:13
    Result: 64,...,133,...

**语录->QID**

    hget quotation:text f72b00a56a403e0f152e67818be96826 // 查询语录字符串MD5
    Result: 133


##贡献者

Project-Vanish / Plutonist (wspl/Plutonium/plqws)


##License

MIT