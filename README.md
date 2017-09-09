# el-borracho-basic

[![Greenkeeper badge](https://badges.greenkeeper.io/nextorigin/el-borracho-basic.svg)](https://greenkeeper.io/)

[![Dependency Status][dependency]][david]
[![devDependency Status][dev-dependency]][david-dev]
[![Downloads][downloads]][npm]

One-line zero-config ElBorrachoJS UI+API+Stats metapackage

[![NPM][npm-stats]][npm]

## Installation & Usage
```sh
npm install --save el-borracho-basic

`npm bin`/el-borracho
```

## Configuration

Create a JSON or JS file containing or exporting a config object, and pass the path as the first argument to el-borracho.

#### config.json (defaults)
```json
{
  "address": "0.0.0.0",
  "api": true,
  "stats": true,
  "ui": true
}
```

*All other options are passed through to [nextorigin-express-skeleton][nextorigin-express-skeleton].*

```sh
`npm bin`/el-borracho ./config.json
```

## License

MIT

  [elborrachojs]:  https://elborrachojs.com
  [nextorigin-express-skeleton]:  https://github.com/nextorigin/express-skeleton

  [dependency]: https://img.shields.io/david/nextorigin/el-borracho-basic.svg?style=flat-square
  [david]: https://david-dm.org/nextorigin/el-borracho-basic
  [dev-dependency]: https://img.shields.io/david/dev/nextorigin/el-borracho-basic.svg?style=flat-square
  [david-dev]: https://david-dm.org/nextorigin/el-borracho-basic?type=dev
  [downloads]: https://img.shields.io/npm/dm/el-borracho-basic.svg?style=flat-square
  [npm]: https://www.npmjs.org/package/el-borracho-basic
  [npm-stats]: https://nodei.co/npm/el-borracho-basic.png?downloads=true&downloadRank=true&stars=true
