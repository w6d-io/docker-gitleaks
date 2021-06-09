module github.com/zricethezav/gitleaks/v7

go 1.16

replace github.com/go-git/go-git/v5 => github.com/zricethezav/go-git/v5 v5.2.2

require (
	github.com/BurntSushi/toml v0.3.1
	github.com/go-git/go-git/v5 v5.2.0
	github.com/google/go-cmp v0.4.0 // indirect
	github.com/hako/durafmt v0.0.0-20191009132224-3f39dc1ed9f4
	github.com/jessevdk/go-flags v1.4.0
	github.com/sergi/go-diff v1.1.0
	github.com/sirupsen/logrus v1.4.2
	golang.org/x/sync v0.0.0-20201020160332-67f06af15bc9
	gopkg.in/yaml.v2 v2.2.8 // indirect
)
