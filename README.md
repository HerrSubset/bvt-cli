# bvt-cli
With this tool you can view information of several belgian volleyball federations in the command line. It uses the [bvt](https://github.com/HerrSubset/bvt) gem to obtain this information, so you should check the information on that gem to see which federations are available.

## Installation
This tool was written in [ruby](https://www.ruby-lang.org/en/) so you will have to install that first. Normally this should also install [rubygems](https://rubygems.org/), which will be used to install the other dependencies. Besides ruby you will also need [git](https://www.git-scm.com/).


First you have to install [thor](http://whatisthor.com/) and [bvt](https://github.com/HerrSubset/bvt). Note that the installation command for bvt change as its version changes.
```
  gem install thor
  git clone https://github.com/HerrSubset/bvt
  cd bvt
  gem build bvt.gemspec
  gem install bvt-X.X.X.gem
```


Now that you have all dependencies, you can install bvt-cli.

```
  git clone https://github.com/HerrSubset/bvt-cli
  cd bvt-cli
  gem build bvt-cli.gemspec
  gem install bvt-cli-X.X.X.gem
```


## Usage
bvt-cli uses a few subcommands that allows you to access it's functionality. The first one is the *calendar* subcommand.

```
  bvt-cli calendar -f <federation> [-l <league>] [-t <team>]
```

The league and team flag are optional. In case you don't provide values for them, you will be prompted for them.

Example usage:
```
$ bvt-cli calendar -f vvb -l "2de divisie heren A" -t "mendo booischot c"
[INFO] loading vvb

Calendar for mendo booischot c:
h2a-0094  13/09/2015	mendo booischot c - v.c. zoersel b   3-0
h2a-0004  19/09/2015	elvoc elen - mendo booischot c   1-3
h2a-0010  11/10/2015	mendo booischot c - vc flamingo's-heidesmash nijlen   1-3
h2a-0014  17/10/2015	v.c. herenthout - mendo booischot c   2-3
h2a-0022  25/10/2015	mendo booischot c - wara genk b   3-0
h2a-0030  08/11/2015	v.c. zoersel b - mendo booischot c   3-0
h2a-0034  15/11/2015	mendo booischot c - kvc sparvoc lanaken-briegden   2-3
h2a-0038  21/11/2015	vck bolderberg - mendo booischot c   1-3
h2a-0044  29/11/2015	mendo booischot c - avoc achel b   3-1
h2a-0054  06/12/2015	mendo booischot c - he-voc hechtel-eksel   3-0
h2a-0058  12/12/2015	warsco-units volh.eisden maasmechelen - mendo booischot c   1-3
h2a-0064  10/01/2016	mendo booischot c - vc camba geel   3-1
h2a-0070  17/01/2016	mendo booischot c - elvoc elen   3-1
h2a-0075  24/01/2016	vc flamingo's-heidesmash nijlen - mendo booischot c   3-1
h2a-0082  31/01/2016	mendo booischot c - v.c. herenthout   3-0
h2a-0085  21/02/2016	wara genk b - mendo booischot c   1-3
h2a-0101  05/03/2016	kvc sparvoc lanaken-briegden - mendo booischot c
h2a-0104  13/03/2016	mendo booischot c - vck bolderberg
h2a-0114  19/03/2016	avoc achel b - mendo booischot c
h2a-0120  09/04/2016	he-voc hechtel-eksel - mendo booischot c
h2a-0124  17/04/2016	mendo booischot c - warsco-units volh.eisden maasmechelen
h2a-0132  23/04/2016	vc camba geel - mendo booischot c
```



The second subcommand is the one for *rankings*. The usage is very similar.

```
  bvt-cli rankings -f <federation> [-l <league>]
```

Also this time the league flag is optional.

Example usage:
```
$ bvt-cli rankings -f vvb -l "2de divisie heren A"
[INFO] loading vvb
kvc sparvoc lanaken-briegden         	16	10	4	0	2	44	15	38
vc flamingo's-heidesmash nijlen      	16	11	1	2	2	41	19	37
mendo booischot c                    	16	11	1	1	3	40	21	36
v.c. zoersel b                       	16	10	0	0	6	33	24	30
vc camba geel                        	17	8	2	1	6	37	32	29
he-voc hechtel-eksel                 	16	8	1	2	5	33	28	28
wara genk b                          	16	5	3	1	7	31	34	22
vck bolderberg                       	16	5	1	2	8	29	33	19
elvoc elen                           	16	4	0	5	7	24	38	17
warsco-units volh.eisden maasmechelen	16	3	2	1	10	20	39	14
v.c. herenthout                      	17	3	1	2	11	21	43	13
avoc achel b                         	16	1	2	1	12	16	43	8
```
