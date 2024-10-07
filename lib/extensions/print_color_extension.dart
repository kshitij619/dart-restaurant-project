extension PrintColorExtension on String {
  String get black => '\x1B[30m$this'.reset;
  String get red => '\x1B[31m$this'.reset;
  String get green => '\x1B[32m$this'.reset;
  String get yellow => '\x1B[33m$this'.reset;
  String get blue => '\x1B[34m$this'.reset;
  String get magenta => '\x1B[35m$this'.reset;
  String get cyan => '\x1B[36m$this'.reset;
  String get white => '\x1B[37m$this'.reset;

  String get reset => '$this\x1B[0m';
}
