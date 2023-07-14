# 狆（ちん）

[![Build Status](https://github.com/1s22s1/Chin.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/1s22s1/Chin.jl/actions/workflows/CI.yml?query=branch%3Amain)

狆は、週末案件で作成中の正規表現です。

## テストの実行方法

```console
julia --project=. -e 'using Pkg;Pkg.test()'
```

## Debugger.jlの使い方

Chinの上位ディレクトリで、実行する。

```console
inunigashi@penguin:~/pkgdev$ julia

julia> using Debugger, Chin
julia> import Chin: letterRegexp
julia> @enter letterRegexp("a", "ab")
```