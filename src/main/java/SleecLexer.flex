import java_cup.runtime.Symbol;

%%

%class SleecLexer

%unicode
%line
%column
%public

%{
import com.intellij.psi.TokenType;
%}

// Definitions
KEYWORD = event|measure|constant|when|then|within|minutes|hours|seconds|unless|otherwise|boolean|numeric|scale|not|and|or|def_start|def_end|rule_end|rule_start|concern_start|concern_end|purpose_start|purpose_end|True|False|def_start|def_end|eventually|else|exists|while|meanwhile
EXCEPTION = ArithmeticError|AssertionError|AttributeError|BaseException|BlockingIOError|BrokenPipeError|BufferError|BytesWarning|ChildProcessError|ConnectionAbortedError|ConnectionError|ConnectionRefusedError|ConnectionResetError|DeprecationWarning|EOFError|Ellipsis|EnvironmentError|Exception|FileExistsError|FileNotFoundError|FloatingPointError|FutureWarning|GeneratorExit|IOError|ImportError|ImportWarning|IndentationError|IndexError|InterruptedError|IsADirectoryError|KeyError|KeyboardInterrupt|LookupError|MemoryError|ModuleNotFoundError|NameError|NotADirectoryError|NotImplemented|NotImplementedError|OSError|OverflowError|PendingDeprecationWarning|PermissionError|ProcessLookupError|RecursionError|ReferenceError|ResourceWarning|RuntimeError|RuntimeWarning|StopAsyncIteration|StopIteration|SyntaxError|SyntaxWarning|SystemError|SystemExit|TabError|TimeoutError|TypeError|UnboundLocalError|UnicodeDecodeError|UnicodeEncodeError|UnicodeError|UnicodeTranslateError|UnicodeWarning|UserWarning|ValueError|Warning|WindowsError|ZeroDivisionError
BUILTIN = abs|all|any|ascii|bin|breakpoint|callable|chr|classmethod|compile|complex|copyright|credits|delattr|dir|divmod|enumerate|eval|exec|exit|filter|format|frozenset|getattr|globals|hasattr|hash|help|hex|id|input|isinstance|issubclass|iter|len|license|locals|map|max|memoryview|min|next|oct|open|ord|pow|print|quit|range|repr|reversed|round|set|setattr|slice|sorted|staticmethod|sum|type|vars|zip
DOCSTRING = (?s)(?:r|u|f|fr|rf|b|br|rb)?'''[^'\\]*((\\.|'(?!''))[^'\\]*)*(''')?|(?s)(?:r|u|f|fr|rf|b|br|rb)?\"\"\"[^\"\\]*((\\.|\"(?!\"\"))[^\"\\]*)*(\"\"\")?
STRING = (?s)(?:r|u|f|fr|rf|b|br|rb)?'[^'\\\n]*(\\.[^'\\\n]*)*'?|(?s)(?:r|u|f|fr|rf|b|br|rb)?\"[^\"\\\n]*(\\.[^\"\\\n]*)*\"?
TYPES = bool|bytearray|bytes|dict|float|int|list|str|tuple|object
NUMBER = (?:0x|0b|0o|#)[\da-fA-F]+|(\d*\.)?\d+
CLASSDEF = (?<=\bclass)[ \t]+\w+[ \t]*[:\(]
DECORATOR = ^[ \t]*@[\w\d\.]+
INSTANCE = super|self|cls
COMMENT = //[^\n]*

// Rules
{KEYWORD}     { return new Symbol(SleecTypes.KEYWORD); }
{EXCEPTION}   { return new Symbol(SleecTypes.EXCEPTION); }
{BUILTIN}     { return new Symbol(SleecTypes.BUILTIN); }
{DOCSTRING}   { return new Symbol(SleecTypes.DOCSTRING); }
{STRING}      { return new Symbol(SleecTypes.STRING); }
{TYPES}       { return new Symbol(SleecTypes.TYPES); }
{NUMBER}      { return new Symbol(SleecTypes.NUMBER); }
{CLASSDEF}    { return new Symbol(SleecTypes.CLASSDEF); }
{DECORATOR}   { return new Symbol(SleecTypes.DECORATOR); }
{INSTANCE}    { return new Symbol(SleecTypes.INSTANCE); }
{COMMENT}     { return new Symbol(SleecTypes.COMMENT); }
[\n]          { return new Symbol(SleecTypes.SYNC); }
[ \t]         { /* Ignore whitespace */ }
