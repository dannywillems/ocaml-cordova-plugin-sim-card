# ocaml-cordova-plugin-sim-card

[![LGPL-v3 licensed](https://img.shields.io/badge/license-LGPLv3-blue.svg)](https://raw.githubusercontent.com/dannywillems/ocaml-cordova-plugin-sim-card/master/LICENSE)
[![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-sim-card.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-sim-card)

Binding to
[cordova-plugin-sim](https://github.com/pbakondy/cordova-plugin-sim)

## What does cordova-plugin-sim-card do ?

```
This is a cordova plugin to get data from the SIM card like the carrier name,
mcc, mnc and country code and other system dependent additional info.
```

Source: [cordova-plugin-sim](https://github.com/pbakondy/cordova-plugin-sim)

## How to install and compile your project by using this plugin ?

Don't forget to switch to a compiler **>= 4.03.0**.
```Shell
opam switch 4.03.0
```

* If you added
[ocaml-cordova-plugin-list](https://github.com/dannywillems/ocaml-cordova-plugin-list)
as opam package provider, you can use
```
opam install cordova-plugin-sim-card
```

* Else, you can use opam by pinning the repository with
```Shell
opam pin add cordova-plugin-sim-card https://github.com/dannywillems/ocaml-cordova-plugin-sim-card.git
```

To compile your project, use
```Shell
ocamlfind ocamlc -c -o [output_file] -package gen_js_api -package cordova-plugin-sim-card [...] -linkpkg [other arguments]
```

Don't forget to install cordova-plugin-sim with
```Shell
cordova plugin add cordova-plugin-sms
```

## How to use ?

* See the [official documentation](https://github.com/pbakondy/cordova-plugin-sim)
