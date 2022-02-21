library pangu;

class Pangu {
  static RegExp _cjkQuote = RegExp(
      '([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])(["])');

  static RegExp _quoteCJK = RegExp(
      '(["])([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  static RegExp _fixQuote = RegExp("([\"']+)(\s*)(.+?)(\s*)([\"']+)");

  static RegExp _fixSingleQuote = RegExp(
      "([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])( )(')([A-Za-z])");

  static RegExp _hashANSCJKhash = RegExp(
      '([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])(#)([A-Za-z0-9\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff]+)(#)([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  static RegExp _cjkHash = RegExp(
      '([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])(#([^ ]))');

  static RegExp _hashCJK = RegExp(
      '(([^ ])#)([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  static RegExp _cjkOperatorANS = RegExp(
      r'([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([\+\-\*\/=&\\|<>])([A-Za-z0-9])');

  static RegExp _ansOperatorCJK = RegExp(
      r'([A-Za-z0-9])([\+\-\*\/=&\\|<>])([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  static RegExp _cjkBracketCJK = RegExp(
      '([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([\(\[\{<\u201c]+(.*?)[\)\]\}>\u201d]+)([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  static RegExp _cjkBracket = RegExp(
      '([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([\(\[\{<\u201c>])');

  static RegExp _bracketCJK = RegExp(
      '([\)\]\}>\u201d<])([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  static RegExp _fixBracket =
      RegExp('([\(\[\{<\u201c]+)(\s*)(.+?)(\s*)([\)\]\}>\u201d]+)');

  static RegExp _fixSymbol = RegExp(
      '([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([~!;:,\.\?\u2026])([A-Za-z0-9])');

  static RegExp _cjkANS = RegExp(
      '([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])([A-Za-z0-9`\$%\^&\*\-=\+\\\|/@\u00a1-\u00ff\u2022\u2027\u2150-\u218f])');

  static RegExp _ansCJK = RegExp(
      '([A-Za-z0-9`~\$%\^&\*\-=\+\\\|/!;:,\.\?\u00a1-\u00ff\u2022\u2026\u2027\u2150-\u218f])([\u2e80-\u2eff\u2f00-\u2fdf\u3040-\u309f\u30a0-\u30ff\u3100-\u312f\u3200-\u32ff\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff])');

  /// Automatically insert whitespace between CJK (Chinese, Japanese, Korean),
  /// half-width English, digit and symbol characters.
  static String spacingText(String? text) {
    if (text == null) {
      return "";
    }

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

    newText =
        newText.replaceAllMapped(_cjkHash, (Match m) => "${m[1]} ${m[2]}");

    newText =
        newText.replaceAllMapped(_hashCJK, (Match m) => "${m[1]} ${m[3]}");

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
