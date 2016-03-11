# bvt-cli
With this tool you can view information of several belgian volleyball federations in the command line. It uses the [bvt](https://github.com/HerrSubset/bvt) gem to obtain this information, so you should check the information on that gem to see which federations are available.

## Installation
This tool was written in [ruby](https://www.ruby-lang.org/en/) so you will have to install that first. Normally this should also install [rubygems](https://rubygems.org/), which will be used to install the other dependencies. Besides ruby you will also need [git](https://www.git-scm.com/).


First you have to install [thor](http://whatisthor.com/), [icalendar](https://github.com/icalendar/icalendar) and [bvt](https://github.com/HerrSubset/bvt). Note that the installation command for bvt changes as its version changes.
```
  gem install thor
  gem install icalendar
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
  bvt calendar [-f <federation>] [-l <league>] [-t <team>]
```

All the flags are optional. In case you don't provide values for them, you will be prompted for them.

Example usage:
```
$ bvt calendar -f vvb -l "2de divisie heren A" -t "MENDO BOOISCHOT C"

Calendar for MENDO BOOISCHOT C:
H2A-0094  13/09/2015	MENDO BOOISCHOT C - V.C. ZOERSEL B   3-0
H2A-0004  19/09/2015	ELVOC ELEN - MENDO BOOISCHOT C   1-3
H2A-0010  11/10/2015	MENDO BOOISCHOT C - VC FLAMINGO'S-HEIDESMASH NIJLEN   1-3
H2A-0014  17/10/2015	V.C. HERENTHOUT - MENDO BOOISCHOT C   2-3
H2A-0022  25/10/2015	MENDO BOOISCHOT C - WARA GENK B   3-0
H2A-0030  08/11/2015	V.C. ZOERSEL B - MENDO BOOISCHOT C   3-0
H2A-0034  15/11/2015	MENDO BOOISCHOT C - KVC SPARVOC LANAKEN-BRIEGDEN   2-3
H2A-0038  21/11/2015	VCK BOLDERBERG - MENDO BOOISCHOT C   1-3
H2A-0044  29/11/2015	MENDO BOOISCHOT C - AVOC ACHEL B   3-1
H2A-0054  06/12/2015	MENDO BOOISCHOT C - HE-VOC HECHTEL-EKSEL   3-0
H2A-0058  12/12/2015	WARSCO-UNITS VOLH.EISDEN MAASMECHELEN - MENDO BOOISCHOT C   1-3
H2A-0064  10/01/2016	MENDO BOOISCHOT C - VC CAMBA GEEL   3-1
H2A-0070  17/01/2016	MENDO BOOISCHOT C - ELVOC ELEN   3-1
H2A-0075  24/01/2016	VC FLAMINGO'S-HEIDESMASH NIJLEN - MENDO BOOISCHOT C   3-1
H2A-0082  31/01/2016	MENDO BOOISCHOT C - V.C. HERENTHOUT   3-0
H2A-0085  21/02/2016	WARA GENK B - MENDO BOOISCHOT C   1-3
H2A-0101  05/03/2016	KVC SPARVOC LANAKEN-BRIEGDEN - MENDO BOOISCHOT C   2-3
H2A-0104  13/03/2016	MENDO BOOISCHOT C - VCK BOLDERBERG
H2A-0114  19/03/2016	AVOC ACHEL B - MENDO BOOISCHOT C
H2A-0120  09/04/2016	HE-VOC HECHTEL-EKSEL - MENDO BOOISCHOT C
H2A-0124  17/04/2016	MENDO BOOISCHOT C - WARSCO-UNITS VOLH.EISDEN MAASMECHELEN
H2A-0132  23/04/2016	VC CAMBA GEEL - MENDO BOOISCHOT C

```



The second subcommand is the one for *rankings*. The usage is very similar.

```
  bvt rankings [-f <federation>] [-l <league>]
```

Also this time the league flag is optional.

Example usage:
```
$ bvt rankings -f vvb -l "2de divisie heren A"
Team                                 	G	W3-0/1	W3-2	L2-3	L0/1-3	WS	LS	P
VC FLAMINGO'S-HEIDESMASH NIJLEN      	17	12	1	2	2	44	19	40
KVC SPARVOC LANAKEN-BRIEGDEN         	17	10	4	1	2	46	18	39
MENDO BOOISCHOT C                    	17	11	2	1	3	43	23	38
HE-VOC HECHTEL-EKSEL                 	17	9	1	2	5	36	29	31
V.C. ZOERSEL B                       	17	10	0	0	7	33	27	30
VC CAMBA GEEL                        	17	8	2	1	6	37	32	29
VCK BOLDERBERG                       	17	6	1	2	8	32	34	22
WARA GENK B                          	17	5	3	1	8	32	37	22
ELVOC ELEN                           	17	4	0	5	8	25	41	17
WARSCO-UNITS VOLH.EISDEN MAASMECHELEN	17	3	2	1	11	20	42	14
V.C. HERENTHOUT                      	17	3	1	2	11	21	43	13
AVOC ACHEL B                         	17	2	2	1	12	19	43	11
```


It is also possible to generate ical files of a certain team's calendar. This command is completely analogous to the calendar command. Usage:

```
  bvt ical [-f <federation>] [-l <league>] [-t <team>]
```

It will create a .ics file in your current directory that contains the calendar.
