# ACGMedia-Server
*「ACG Media」服务端*

该程序基于 Node.JS / Redis，用于「ACG Media」的数据储存、ACGMedia-Cache 的缓存数据源，以及提供直接的语录获取功能。


----------


##客户端 API
####获取一条随机语录
**接口地址**
> http://acgmedia.ant.moe/api/getSingleQuotation

**请求方式** GET

**请求参数**

`dataType` 返回结果类型，默认 json，可选 text（UTF-8 纯文本）

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
```


----------


###获取一条语录
**接口地址**
> http://acgmedia.ant.moe/api/getSingleQuotation

**请求方式** GET

**请求参数**

`qid` 语录编号

`dataType` 返回结果类型，默认 json，可选 text（UTF-8 纯文本）

**JSON返回结果示例**
```
//同上
```


----------


###获得指定条件的语录
**接口地址**
> http://acgmedia.ant.moe/api/getQuotations

**请求方式** GET

**请求参数**

（支持多值匹配，请使用英文半角逗号连接）

`category_id` 语录类别ID

`form_id` 来自作品ID

**JSON数组返回结果示例**
```
[{
  ok: 1,
  text: '或许前路永夜，即便如此我也要前进，因为星光即使微弱也会为我照亮前途。',
  qid: 132,
  type: 'Quotation',
  category: '醍醐灌顶'
  category_id: 3,
  from: '《四月是你的谎言》',
  from_id: 13
},{
  ok: 1,
  text: '莫扎特曾经说过大胆地踏上旅途吧，我不知道路途的前方究竟有什么，但是，我们还是迈出了步伐，我们仍在旅途之中。',
  qid: 133,
  type: 'Quotation',
  category: '醍醐灌顶'
  category_id: 3,
  from: '《四月是你的谎言》',
  from_id: 13
}]
```


##贡献者

Project-Vanish

|-Plutonist (wspl/Plutonium/plqws)


##License

MIT