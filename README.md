# codicR
============================

An RStudio Addin for tranlating Japanese variable/function names to English by Codic API

![codicR]("https://github.com/ksmzn/codicR/blob/master/man/figures/codicR.gif")

## Installation

```console
> devtools::install_github("ksmzn/codicR")
```

## Setup

1. Create your account at [Codic](https://codic.jp/login).

2. Then, save your accesstoken to environment variables as `CODIC_TOKEN`;

```r
Sys.setenv(CODIC_TOKEN='<your-token>')
```

3. In your RStudio, select a text which you want tranlate.

4. Choose `Translate by Codic` from Addins menu.

5. The Addin modify selected text to a new translated one. 

