#import "@preview/fontawesome:0.2.0": *

#set text(font: ("Source Han Sans SC", ), size: 14pt, lang: "zh", region: "CN")
#show raw: set text(font: "LXGW WenKai Mono GB", weight: 700, size: 1.25em)
#set page(width: auto, height: auto, margin: 1cm)

#let taowa(it, size) = [

#let title(it) = {
  move(box(
    text(stroke: black + 0.01em, size: 1.8em, it),
    fill: blue.lighten(60%),
    outset: 0.5cm,
    radius: (top-left: 0.5cm, bottom-right: 0.5cm),
  ), dx: -0.2cm)
}

#let under-heavy-line(it) = {
  underline(it, stroke: blue.lighten(80%) + 0.5em, evade: false, background: true, offset: -0.5pt)
}
#let subtitle(it) = {
  set text(stroke: 0.01em, size: 1.4em)
  under-heavy-line(it)
}
#show heading.where(level: 1): it => {
  align(center, under-heavy-line(it))
}
#show heading.where(level: 2): it => {
  align(center, under-heavy-line(it))
}

#let turing-poly = [
  可以除 $w$ 或除 $log$，很难降次数。$omega < 2.372$ 为矩阵乘法复杂度指数下界。

  #figure(table(
    stroke: 0.5pt,
    inset: .5em,
    columns: 2,
    align: left,
    [logbit-OV、LCS、\ 两数最大 or/最小 and], $O(n^2)$,
    [nbit-OV], $O(n^omega)$,
    [链 mex], $O(n^(omega slash 2))$,
    [$min +$ 卷积], $O(n^2)$,
    [3SUM、4SUM、两对数和相等、\ 三点共线、三线共点、\ 长为 $3$ 等差数列], $O(n^2)$,
    [3XOR], $O(n^2)$,
    [APSP、$min +$ 矩阵乘法], $O(n^3)$,
    [$+ times$/$01$ 矩阵乘/矩阵求逆/高斯消元], $O(n^omega)$,
    [$min max$ 矩阵乘], $O(n^(2 tilde (omega+3) slash 2))$,
    [$op("and") op("or")$ 矩阵乘、稠密图传递闭包], $O(n^(2 tilde omega))$,
    [稀疏图传递闭包], $O(n^2)$,
    [区间相等对/逆序对、链颜色数、\ 稀疏图三元环计数、行加列求和、\ 
区间 $plus.minus 1$ 全局数 $0$], $O(n^(omega slash 2 tilde 2 omega slash (omega+1)))$,
  ))

  ——From CommonAnts
]

#let turing-npc = [
  - #text(lang: "en")[Karp's 21 NP-Complete Problems]
  - $m$ 个大小均为 $c$ 的背包能否装下给定物品\
    （强 NPC，即不存在伪多项式算法）
  - 简单环计数
  - 二分图完美匹配计数
  - 2-SAT 计数
  - 拓扑序计数
  - 无向图欧拉回路/欧拉路径计数
]

#let turing-reference = [
  #set text(size: 12pt)

  *参考资料*：学会计算模型，复杂性，归约/问题类等计算理论基本思想后，自行搜索精细复杂性理论入门讲解 [Fine-grained complexity]

  *相关OI博客*：
  - lca的讲解（bilibili 视频 \@蔡德仁）
  - lxl/crz 的相关讲解（资料集）
  - EI《一些经典问题比暴力快一点点的算法》（博客）
  - Ynoi《浅谈归约矩乘》（洛谷博客）
  - Futari《归约矩乘》（洛谷博客）
  - do-while-true《一小类矩阵乘法相关归约》（博客）
  - hqztrue《浅谈矩阵乘法在算法竞赛中的应用》（知乎）
  - 杨敏行《浅谈复杂度及其在解决问题方面的应用》\
    闫陈效《计算理论与 OI 中的难解问题》（2024 集训队论文集）

  ——From CommonAnts
]

#let tables = [
  #let w = (2, 3, 4, 5, 6, 7, 8, 8, 9, 10, 10, 11, 12, 12, 13, 13, 14, 15)
  #let d = (4, 12, 32, 64, 128, 240, 448, 768, 1344, 2304, 4032, 6720, 10752, 17280, 26880, 41472, 64512, 103680)
  #let argmaxd = (8, 96, 840, 9240, 83160, 997920, 8648640, 98017920, 931170240, 9311702400, 97772875200, 963761198400, 9316358251200, 97821761637600, 978217616376000, 9097423832296800, 96172766227137600, 897612484786617600)
  #let argmaxd = argmaxd.map(x => {
    let s = str(x)
    let s_ = ()
    for i in range(s.codepoints().len()) {
      s_.push(s.codepoints().at(i))
      if calc.rem(i, 8) == 7 {
        s_.push("\n")
      }
    }
    text(s_.join(""), size: .7em, font: "LXGW WenKai Mono GB")
  })
  #let col = 9

  #figure(table(
    columns: col + 1,
    fill: (x, y) => {
      if (calc.rem(y, 3) == 0) {
        gray.lighten(45%)
      }
    },
    ..{
      let res = ()
      for i in range(2) {
        res.push($n <= $)
        res += range(1+i*col, 10+i*col).map(j => $10^#j$)
        res.push($max {omega(n)}$)
        res += range(1+i*col, 10+i*col).map(j => $#w.at(j - 1)$)
        res.push($max {d(n)}$)
        res += range(1+i*col, 10+i*col).map(j => $#d.at(j - 1)$)
        res.push($arg max {d(n)}$)
        res += range(1+i*col, 10+i*col).map(j => argmaxd.at(j - 1))
      }
      res
    }
  ))
]

#let others = [
  - vuqa 是什么意思？\
    van 能的 UOJ 群啊

  - UB (Undefined Behavior，未定义行为) 是什么？\
    zh.cppreference.com/w/cpp/language/ub
    - 我的引用怎么失效了（`tr[x].ls=insert()`）？\
      在 C++ 17 之前，这段代码可能的求值顺序是：求出 `tr[x]` 的位置 → 插入（此时 `vector` 可能因为扩容而移动 `tr` 的存储的位置） → 已经求出来了的 `tr[x]` 的位置失效了，但我们要往这个失效的位置写入数据 → 寄了。

    - 扩展阅读：求值顺序（*不是运算结合性*）：\
      zh.cppreference.com/w/cpp/language/eval_order
  - 怎么做 NOI 排版风格的题面？\
    官方工具：TUACK + LaTeX\
    广告：#fa-github()/Wallbreaker5th/fuzzy-cnoi-statement\
    #h(3em)#fa-github()/Wallbreaker5th/OI-statement-LaTeX
  - 那个 U 群常见问题速查的图？\
    #{
      let ratio = 20%
      scale(box(it, width: size.width, height: size.height), ratio, reflow: true)
    }

  #v(2em)
]

#let sites = [
  - 那个画图的网站？\
    csacademy.com/app/graph_editor/

  - 那个查原题的网站？\
    www.yuantiji.ac/zh
  - 那个 AtCoder 评分的网站？\
    kenkoooo.com/atcoder/\#/table/
  - 那个能看 Codeforces 题目整理的网站？\
    cftracker.netlify.app/contests
  - 那个能看所有 OJ 的比赛的网站？\
    clist.by
  - 那个看编译得到的汇编的网站？\
    godbolt.org
  - 那个把 C 语言类型转成人话的网站？\
    cdecl.org
  - XXX 用 LaTeX 怎么打？\
    detexify.kirelabs.org/classify.html\
    许多网站使用 KaTeX 渲染公式，相应文档见\
    katex.org/docs/supported
]

#let tasks = [
  - 单点修改区间 $op("mex")$\
    考虑一个值 $v$，$v$ 没出现说明 $[l,r]$ 夹在 $v$ 的相邻两次出现之间。因此对于每个值 $v$ 的相邻两次出现 $i$ 和 $j$，在数据结构中插入点 $(i,j)$、权值为 $v$；查询为 $i<l<=r<j$ 的点的权值最小值（单点修改，矩形求 $min$），使用树套树即可。

  
]

#let credits = [
  #set text(fill: gray)
  Version: #datetime.today().display()\
  Visit #fa-github()/Wallbreaker5th/vuqa for the source code and the latest version.
]

#title[U 群常见问题速查]

#v(-2em)

#grid(
  columns: (28em, 28em, 28em, 28em),
  grid.cell(inset: 1em, colspan: 2)[= 图灵奖],
  grid.cell(x: 0, y: 1, grid(
    inset: 1em,
    columns: (100%,),
    [== 多项式复杂度],
    turing-poly
  )),
  grid.cell(x: 1, y: 1, grid(
    inset: 1em,
    columns: (100%,),
    turing-reference,
    [== NP-Hard],
    turing-npc
  )),
  grid.cell(x: 0, y: 2, colspan: 2, grid(
    inset: 1em,
    columns: (100%,),
    [= 约数个数/不同质因子个数表],
    tables
  )),
  grid.cell(x: 2, y: 0, rowspan: 3, grid(
    inset: 1em,
    columns: (100%,),
    [= 问题与做法],
    tasks,
    [= 网站],
    sites
  )),
  grid.cell(x: 3, y: 0, inset: 1em)[= 其他],
  grid.cell(x: 3, y: 1, rowspan: 2, inset: 1em, others)
)

#place(bottom+right, credits)

]

#context{
  let size = measure(taowa(none, (width: 0pt, height: 0pt)))
  size = measure(taowa(none, size))
  let it = []
  for i in range(5) {
    it = taowa(it, size)
  }
  it
}
