library pangu;

class Pangu {
  RegExp _cjkQuote = RegExp(
      r'([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])(["])');

  RegExp _quoteCJK = RegExp(
      r'(["])([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  RegExp _fixQuote = RegExp("([\"']+)(\s*)(.+?)(\s*)([\"']+)");

  RegExp _fixSingleQuote = RegExp(
      r"([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])( )(')([A-Za-z])");

  RegExp _hashANSCJKhash = RegExp(
      r'([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])(#)([A-Za-z0-9\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff]+)(#)([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  RegExp _cjkHash = RegExp(
      r'([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])(#([^ ]))');

  RegExp _hashCJK = RegExp(
      r'(([^ ])#)([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  RegExp _cjkOperatorANS = RegExp(
      r'([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([\+\-\*\/=&\\|<>])([A-Za-z0-9])');

  RegExp _ansOperatorCJK = RegExp(
      r'([A-Za-z0-9])([\+\-\*\/=&\\|<>])([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  RegExp _cjkBracketCJK = RegExp(
      r'([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([\(\[\{<\u201c]+(.*?)[\)\]\}>\u201d]+)([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  RegExp _cjkBracket = RegExp(
      r'([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([\(\[\{<\u201c>])');

  RegExp _bracketCJK = RegExp(
      r'([\)\]\}>\u201d<])([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  RegExp _fixBracket =
  RegExp(r'([\(\[\{<\u201c]+)(\s*)(.+?)(\s*)([\)\]\}>\u201d]+)');

  RegExp _fixSymbol = RegExp(
      r'([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([~!;:,\.\?\u2026])([A-Za-z0-9])');

  RegExp _cjkANS = RegExp(
      r'([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([A-Za-z0-9`\$%\^&\*\-=\+\\\|/@\u00a1-\u00ff\u2022\u2027\u2150-\u218f])');

  RegExp _ansCJK = RegExp(
      r'([A-Za-z0-9`~\$%\^&\*\-=\+\\\|/!;:,\.\?\u00a1-\u00ff\u2022\u2026\u2027\u2150-\u218f])([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  String spacingText(String text) {
    String newText = text;

    newText =
        newText.replaceAllMapped(_cjkQuote, (Match m) => "${m[1]} ${m[2]}");

    newText =
        newText.replaceAllMapped(_quoteCJK, (Match m) => "${m[1]} ${m[2]}");

    newText = newText.replaceAllMapped(
        _fixQuote, (Match m) => "${m[1]}${m[3]}${m[5]}");

    newText = newText.replaceAllMapped(
        _fixSingleQuote, (Match m) => "${m[1]}${m[3]}${m[4]}");

    newText = newText.replaceAllMapped(
        _hashANSCJKhash, (Match m) => "${m[1]} ${m[2]}${m[3]}${m[4]} ${m[5]}");

    newText = newText.replaceAllMapped(_cjkHash, (Match m) => "${m[1]} ${m[2]}");

    newText = newText.replaceAllMapped(_hashCJK, (Match m) => "${m[1]} ${m[3]}");

    newText = newText.replaceAllMapped(
        _cjkOperatorANS, (Match m) => "${m[1]} ${m[2]} ${m[3]}");

    newText = newText.replaceAllMapped(
        _ansOperatorCJK, (Match m) => "${m[1]} ${m[2]} ${m[3]}");

    String oldText = newText;
    String tmpText = newText.replaceAllMapped(
        _cjkBracketCJK, (Match m) => "${m[1]} ${m[2]} ${m[4]}");

    newText = tmpText;
    if (oldText == tmpText) {
      newText =
          newText.replaceAllMapped(_cjkBracket, (Match m) => "${m[1]} ${m[2]}");

      newText =
          newText.replaceAllMapped(_bracketCJK, (Match m) => "${m[1]} ${m[2]}");
    }
    newText = newText.replaceFirstMapped(
        _fixBracket, (Match m) => "${m[1]}${m[3]}${m[5]}");

    newText = newText.replaceAllMapped(
        _fixSymbol, (Match m) => "${m[1]}${m[2]} ${m[3]}");

    newText = newText.replaceAllMapped(_cjkANS, (Match m) => "${m[1]} ${m[2]}");

    newText = newText.replaceAllMapped(_ansCJK, (Match m) => "${m[1]} ${m[2]}");

    return newText;
  }
}
