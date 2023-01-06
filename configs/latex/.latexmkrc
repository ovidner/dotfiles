$ENV{'TZ'}='Europe/Stockholm';
$MSWin_back_slash = 0;
$windows = $^O eq 'MSWin32';

$biber = 'biber --isbn-normalise -D %O %S';

# 4 = use lualatex
# 5 = use xelatex
$pdf_mode = 4;
$dvi_mode = $postscript_mode = 0;

# Unsafe, but needed for Minted to work
$lualatex = 'lualatex -shell-escape %O %S';

# .xdv files are XeLaTeX intermediary files
$clean_ext .= ' %R.xdv %R.synctex.gz';

# https://tex.stackexchange.com/questions/1226/how-to-make-latexmk-use-makeglossaries
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
push @generated_exts, 'ist', 'xdy';
$clean_ext .= ' %R.ist %R.xdy';

sub run_makeglossaries {
  if ( $silent ) {
    if ( $windows ) {
      system("makeglossaries", "-q", $_[0]);
    } else {
      system("makeglossaries -q '$_[0]'");
    }
  }
  else {
    if ( $windows ) {
      system("makeglossaries", $_[0]);
    } else {
      system("makeglossaries '$_[0]'");
    }
  };
}
