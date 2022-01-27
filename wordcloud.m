# https://yurichev.com/news/20220116_wordcloud/
fnames = FileNames["*.md", "/home/chl/Sites/aliquote/content/post", Infinity];

processReal[fname_, fnamePNG_] := Block[{},
  Print[fname];
  txt = Import[fname, "Text"];
  cl = WordCloud[txt];
  Export[fnamePNG, cl]]

process[fname_] := Block[
  {fnamePNG = fname <> ".wordcloud.png"},
  If[FileExistsQ[fnamePNG], Print["already exists: " <> fnamePNG],
   processReal[fname, fnamePNG]]]

Map[process, fnames]
