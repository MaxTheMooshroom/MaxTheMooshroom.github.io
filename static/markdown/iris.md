
## Iris Smart Doorbell

Iris is a smart doorbell with a very simple value proposition: Your data is your own, and you own what you buy. To that end, there is no cloud, there's minimal server infrastructure to use for initiating secure contact, and it uses end-to-end encryption for low-overhead data, and a hybrid encryption model with 2FA for your video data.


# Motivation

With the likes of amazon shutting down a user's smarthome over alleged (and false) racist greetings, and plenty of leaks containing user video data, we were extremely displeased with the state of smart doorbells, and home automation technology as a whole. A house should be exclusively controlled by its occupants, companies should have no say in the matter. This really comes down to product ownership and what it means to purchase an item, which ties in heavily with Right-to-Repair. The crux of the right-to-repair movement, in my opinion, comes down to the question "Who owns devices after they're purchased?". The movement as I understand it is all about the answer to that question being "the customer", and having that be reflected in legislation. As we happen to be supporters of that movement, we wanted to make our contribution to the cause, by providing a product that will be completely owned by the customer without a shadow of a doubt.


# Technical Details

Version 1 of Iris uses the MangoPi MQ Pro SBC, which is comparable to the RaspberryPi 0W. It has an identical footprint, and [beats out the 0W's performance by multiple metrics](https://bret.dk/raspberry-pi-zero-vs-mangopi-mq-pro-benchmarks). The MangoPi uses the Allwinner D1H microprocessor, a single-core RISC-V SoC (System-on-Chip). 


<a href="https://d1.docs.aw-ol.com/en/" target="_blank"><img style="width: 30vw" src="static/img/allwinner-d1h.png" alt="mango pi SoC internal architecture"></a>

**SoC Block Diagram of the Allwinner D1-H.* <a href="https://d1.docs.aw-ol.com/en/" target="_blank"><em>Image credit to allwinner</em></a>


At the time of writing (pre-product-release) we are using [Tina Linux](https://d1.docs.aw-ol.com/en/study/study_1tina/), which is a fork of [OpenWRT](https://openwrt.org/docs/start). Source for Tina Linux can be found [here](https://github.com/mangopi-sbc/Tina-Linux). [We have forked Tina](https://github.com/nucleus-labs/Tina-Linux) though, to clean up some of the issues that have sprung up in development.

<a href="https://d1.docs.aw-ol.com/en/study/study_1tina/" target="_blank"><img style="width: 30vw" src="static/img/Tina_Linux_ARCH.png" alt="Tina Linux architecture"></a>

**Block Diagram of Tina Linux.* <a href="https://d1.docs.aw-ol.com/en/" target="_blank"><em>Image credit to allwinner</em></a>

There are plans to swap to [Mobile NixOS](https://mobile.nixos.org/) in the future after we can pull out necessary drivers, etc from Tina, as Tina has been.... *a pain* to work with. 

