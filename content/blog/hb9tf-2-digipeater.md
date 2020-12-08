---
title: "HB9TF-2 from Rx-iGate to Digipeater"
date: 2020-12-04T22:00:00
author: hb9esx
---

After just over 3 months of operation with the updated software configuration
running `aprx`, an analysis of the `aprx-rf.log` revealed very little activity
on the well-known APRS frequency `144.800 MHz`. Every now and then a ham could
be seen making his or her way through Oberengadin, yet aside from that no other
station, in particular no other digipeaters, could be heard by
[HB9TF-2](/systems/hb9tf-2). It appeared that, in contrast to the situation in
more densely populated areas such as Zurich, Oberengadin was APRS no man's
land.

With the frequency literally unused in Oberengadin, the decision to activate
digipeating functionality was a given.  At 21:10 HB time on December 4th, 2020
the following configuration change was applied on [HB9TF-2](/systems/hb9tf-2)
to extend its functionality with digipeating:

```shell
root@aprs-lszs-hb9tf-2:~# diff /etc/aprx.conf /home/sysop/aprx.conf
23c23
<   beacon via WIDE1-1 symbol "W&" $myloc comment "hb9tf.ch APRS Rx IGate & WIRES-X RPT LSZS 439.2750 -7.6 TSQL 141.3"
---
>   beacon via WIDE1-1 symbol "W&" $myloc comment "hb9tf.ch APRS Digipeater, Rx-iGate & WIRES-X RPT LSZS 439.2750 -7.6 TSQL 141.3"
25a26,35
>
> <digipeater>
>   transmitter $mycall
>
>   <source>
>     source $mycall
>     ratelimit 30 60
>     viscous-delay 5
>   </source>
> </digipeater>
```

The following day on December 5, 2020 at 10:18:16 HB time, the very first APRS
packet to be digipeated by HB9TF-2 originated from no one less than HB9TF's
honorary president Florian HB3XPA / K8RWB, as can be observed in the following
excerpt of `aprx-rf.log`:

```
2020-12-05 09:18:16.375 HB9TF-2   R HB3XPA-1>TV3PP6,WIDE1-1,WIDE2-1:`<0x7f>N_l?"j/`"Gw}QRV 145.500_%
2020-12-05 09:18:20.824 HB9TF-2   T HB3XPA-1>TV3PP6,HB9TF-2*,WIDE1*,WIDE2-1:`<0x7f>N_l?"j/`"Gw}QRV 145.500_%<0x0d>
```

For any questions or feedback regarding [HB9TF-2](/systems/hb9tf-2), please
contact sysop@hb9tf.ch.
