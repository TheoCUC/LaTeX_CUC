# LaTeX_CUC

## 正确打开方式
1. 首先安装 GB/T 7714-2015 参考文献标准：https://github.com/CTeX-org/gbt7714-bibtex-style
下载完毕上方链接文件后，在Terminal中运行`cd ./gbt7714-bibtex-style-2.1`，再运行`sudo make`;
2. Clone 本项目或 Download ZIP 或进入 Release 页面下载本项目文件;
3. 仿照 `template.tex` 文件中的代码完成毕业论文;
4. 修改毕业论文;
5. 在 `cover.doc` 文件中填入封面信息，输出 PDF 文件，与 LaTeX 输出的 PDF 文件拼合在一起.

## 使用说明
* 将 `CUC.cls` 文件放在你的毕业论文 `.tex` 文件夹中，`documentclass{...}` 中填写 `CUC`.
* 中英文摘要的四个输入分别填入`中英文论文标题`、`姓名`、`摘要`、`关键词`.
* 论文的三级标题分别为 `Csection{...}`、`subsection{...}`、`subsubsection{...}`，其中，`Csection{...}` 是为了替换 `section{...}` 以满足论文模板中每个一级大标题另起一页、公式编号为“章节-公式”的需求，具体实现见 `CUC.cls` 文件，应该进行修改.
* 如果使用 VS Code 编辑，请在 `settings.json` 中加入以下内容以实现侧边栏中 STRUCTUERE 的正常工作：
```
"latex-workshop.view.outline.sections": [
    "part",
    "chapter",
    "Csection",
    //"section",
    "subsection",
    "subsubsection",   
],
```
* 绪论后使用命令 `\pagenumbering{arabic}` 开启编号
* 参考文献中，`\bibliography{ref}` 命令指定文献数据库的位置
* 附录和后记在 `addcontentsline` 后书写内容

## TODO
* 制作封面页
* 修改目录样式
* 微调正文样式、字体
* 修改参考文献格式