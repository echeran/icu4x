window.BENCHMARK_DATA = {
  "lastUpdate": 1616084690791,
  "repoUrl": "https://github.com/echeran/icu4x",
  "entries": {
    "Rust Benchmark": [
      {
        "commit": {
          "author": {
            "email": "elango@google.com",
            "name": "Elango",
            "username": "echeran"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "6d3e0a1561fd72797ea50b64077e2c4281d85dd5",
          "message": "Merge pull request #17 from echeran/ci-bench-fixed-decimal\n\nTesting PR - in personal fork - enable utils/fixed-decimal benchmark",
          "timestamp": "2020-10-14T21:04:09-07:00",
          "tree_id": "0f8610177898fa1eed700f55e45ecb6f2e6d3a01",
          "url": "https://github.com/echeran/icu4x/commit/6d3e0a1561fd72797ea50b64077e2c4281d85dd5"
        },
        "date": 1602734939850,
        "tool": "cargo",
        "benches": [
          {
            "name": "plurals/operands/overview",
            "value": 1297,
            "range": "± 81",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/parser/overview",
            "value": 6734,
            "range": "± 365",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/pluralrules/overview",
            "value": 124679,
            "range": "± 10786",
            "unit": "ns/iter"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "nmihai_2000@yahoo.com",
            "name": "Mihai Nita",
            "username": "mihnita"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "fbce283a133bf8865ded6c2806cd992a201a82db",
          "message": "Merge pull request #366 from unicode-org/mihai_latin1\n\nFix for issue #357, Latin 1 definition",
          "timestamp": "2020-10-26T02:56:13-07:00",
          "tree_id": "c000495ad2a67b40a7f97be0e3058e31901c02b1",
          "url": "https://github.com/echeran/icu4x/commit/fbce283a133bf8865ded6c2806cd992a201a82db"
        },
        "date": 1604359888555,
        "tool": "cargo",
        "benches": [
          {
            "name": "plurals/operands/overview",
            "value": 1135,
            "range": "± 64",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/parser/overview",
            "value": 5138,
            "range": "± 336",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/pluralrules/overview",
            "value": 94673,
            "range": "± 5691",
            "unit": "ns/iter"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "dminor@mozilla.com",
            "name": "Dan Minor",
            "username": "dminor"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "73f1d954dc2316e425014a4c68b0339f34ef9d47",
          "message": "Use parsing iterator for LanguageIdentifier PartialEq (#386)\n\n* Use parsing iterator for LanguageIdentifier PartialEq\r\n\r\n* Address review feedback",
          "timestamp": "2020-11-10T10:46:03-08:00",
          "tree_id": "b19692744ffbf0a320c983dd6a0b6cb5405cbdf4",
          "url": "https://github.com/echeran/icu4x/commit/73f1d954dc2316e425014a4c68b0339f34ef9d47"
        },
        "date": 1605201778117,
        "tool": "cargo",
        "benches": [
          {
            "name": "plurals/operands/overview",
            "value": 1341,
            "range": "± 1",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/parser/overview",
            "value": 6058,
            "range": "± 69",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/pluralrules/overview",
            "value": 111881,
            "range": "± 646",
            "unit": "ns/iter"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "zibi@braniecki.net",
            "name": "Zibi Braniecki",
            "username": "zbraniecki"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": false,
          "id": "bd0d43a9383201acd02e13cba79c54856a729026",
          "message": "Reorganize docs and add wiki articles. (#382)",
          "timestamp": "2020-11-12T12:38:17-06:00",
          "tree_id": "ffb79c9115631c738f6188bcaf7225b879839492",
          "url": "https://github.com/echeran/icu4x/commit/bd0d43a9383201acd02e13cba79c54856a729026"
        },
        "date": 1605232518326,
        "tool": "cargo",
        "benches": [
          {
            "name": "plurals/operands/overview",
            "value": 1341,
            "range": "± 54",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/parser/overview",
            "value": 6052,
            "range": "± 258",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/pluralrules/overview",
            "value": 108323,
            "range": "± 5386",
            "unit": "ns/iter"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "elango@google.com",
            "name": "Elango",
            "username": "echeran"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "7033c6bd7dd2c42313b73b6be295f0c0b1092fa4",
          "message": "Merge pull request #19 from echeran/codecov\n\nTesting PR - change Coveralls -> Codecov",
          "timestamp": "2020-11-12T19:37:08-08:00",
          "tree_id": "46ee2ae180afff1a82095c4588cf15e10bab8cc4",
          "url": "https://github.com/echeran/icu4x/commit/7033c6bd7dd2c42313b73b6be295f0c0b1092fa4"
        },
        "date": 1605238898518,
        "tool": "cargo",
        "benches": [
          {
            "name": "plurals/operands/overview",
            "value": 1385,
            "range": "± 80",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/parser/overview",
            "value": 6578,
            "range": "± 601",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/pluralrules/overview",
            "value": 125036,
            "range": "± 8887",
            "unit": "ns/iter"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "sffc@google.com",
            "name": "Shane F. Carr",
            "username": "sffc"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "4cae8e0a2f1e4d497621055c77d0446e17cbe041",
          "message": "Populating Writeable readme with lib.rs (#389)",
          "timestamp": "2020-11-24T17:10:57-06:00",
          "tree_id": "bc1bfc4b39890657ec5c9bd0d56eadacaca9f587",
          "url": "https://github.com/echeran/icu4x/commit/4cae8e0a2f1e4d497621055c77d0446e17cbe041"
        },
        "date": 1606776759246,
        "tool": "cargo",
        "benches": [
          {
            "name": "plurals/operands/overview",
            "value": 1469,
            "range": "± 4",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/parser/overview",
            "value": 7277,
            "range": "± 512",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/pluralrules/overview",
            "value": 114861,
            "range": "± 248",
            "unit": "ns/iter"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "elango@google.com",
            "name": "Elango",
            "username": "echeran"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "d9f01c66ca6126c48cc65dc817e3c820cf7d7f78",
          "message": "Merge pull request #21 from echeran/gregtatum/memory-benchmark-upload-fix\n\nTesting PR on echeran's fork for gregtatum/memory-benchmark-upload-fix",
          "timestamp": "2021-02-04T21:12:24-08:00",
          "tree_id": "a7c739d23fce79b570dccb6eed947f4f4351130a",
          "url": "https://github.com/echeran/icu4x/commit/d9f01c66ca6126c48cc65dc817e3c820cf7d7f78"
        },
        "date": 1612502296765,
        "tool": "cargo",
        "benches": [
          {
            "name": "plurals/operands/overview",
            "value": 1474,
            "range": "± 69",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/parser/overview",
            "value": 6590,
            "range": "± 343",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/pluralrules/overview",
            "value": 97174,
            "range": "± 4248",
            "unit": "ns/iter"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "manishsmail@gmail.com",
            "name": "Manish Goregaokar",
            "username": "Manishearth"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "ae89da479dfbbcfc73fbaa977cd3f4ecfd0e4fac",
          "message": "Allow some clippy lints (#474)",
          "timestamp": "2021-02-02T17:40:53-08:00",
          "tree_id": "b24a02430c995fda5f39e5982049523f7037643c",
          "url": "https://github.com/echeran/icu4x/commit/ae89da479dfbbcfc73fbaa977cd3f4ecfd0e4fac"
        },
        "date": 1612503400400,
        "tool": "cargo",
        "benches": [
          {
            "name": "plurals/operands/overview",
            "value": 1684,
            "range": "± 78",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/parser/overview",
            "value": 7384,
            "range": "± 386",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/pluralrules/overview",
            "value": 109789,
            "range": "± 6744",
            "unit": "ns/iter"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "elango@google.com",
            "name": "Elango",
            "username": "echeran"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": true,
          "id": "03b3486395ee1caa8970cc972c46c2ec40cd8ec7",
          "message": "Merge pull request #22 from echeran/gregtatum/memory-benchmark-upload-fix\n\nTesting PR on echeran's fork for gregtatum/memory-benchmark-upload-fix",
          "timestamp": "2021-02-04T21:35:52-08:00",
          "tree_id": "d21f8c594b7fe2a7e1cff2ff8413b7331c672237",
          "url": "https://github.com/echeran/icu4x/commit/03b3486395ee1caa8970cc972c46c2ec40cd8ec7"
        },
        "date": 1612503922853,
        "tool": "cargo",
        "benches": [
          {
            "name": "plurals/operands/overview",
            "value": 1483,
            "range": "± 203",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/parser/overview",
            "value": 6604,
            "range": "± 469",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/pluralrules/overview",
            "value": 98810,
            "range": "± 6326",
            "unit": "ns/iter"
          }
        ]
      },
      {
        "commit": {
          "author": {
            "email": "gregtatum@users.noreply.github.com",
            "name": "Greg Tatum",
            "username": "gregtatum"
          },
          "committer": {
            "email": "noreply@github.com",
            "name": "GitHub",
            "username": "web-flow"
          },
          "distinct": false,
          "id": "a4a8e4a68a1e9c3b3b0517068bd46707f410bf2e",
          "message": "Pin the nightly version in CI (#526)",
          "timestamp": "2021-03-12T15:19:41-06:00",
          "tree_id": "d6e37aaaa114fcc11a47423215a3457177fa66bb",
          "url": "https://github.com/echeran/icu4x/commit/a4a8e4a68a1e9c3b3b0517068bd46707f410bf2e"
        },
        "date": 1616084690198,
        "tool": "cargo",
        "benches": [
          {
            "name": "plurals/operands/overview",
            "value": 1665,
            "range": "± 67",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/parser/overview",
            "value": 8099,
            "range": "± 657",
            "unit": "ns/iter"
          },
          {
            "name": "plurals/pluralrules/overview",
            "value": 117786,
            "range": "± 5953",
            "unit": "ns/iter"
          }
        ]
      }
    ]
  }
}