
## Iris Smart Doorbell

Iris is a smart doorbell with a very simple value proposition: Your data is your own, and you own what you buy. To that end, there is no cloud, there's minimal server infrastructure to use for initiating secure contact, and it uses end-to-end encryption for low-overhead data, and a hybrid encryption model with 2FA for your video data.

<img src="/static/img/hexagon_v2_2023-Nov-17_02-07-17AM-000.png" alt="Render of the Iris Doorbell" style="width: 15vw;" />

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


# UPDATE - 3/12/24

After a lot of headache-inducing debugging, a couple of months ago we decided to throw out the use
of Tina linux, and instead moved over to writing a nixos config, which is declarative by nature.
This helps a ton with reproducability, and makes debugging a breeze, when the problem is within our
project anyhow. Unfortunately, there is a lot left to be desired in nix packages, but I don't think
that's to its discredit. What I *would* say is to its discredit, however, is the general lack of
clear, easy-to-understand documentation for anyone who isn't already familiar with nix. A close
friend of mine with the online handle of `rummik` is working to address this though.

Back on topic though, developing a config for a nixos image has not been without its serious
difficulties. Not that we expected it to be easy, but we expected most of the problems to be from us,
rather than from `nixpkgs`. Between the "meh" meson functionality/tooling, and the gstreamer packages
being just straight up broken, it was unexpected to need to clean up nix packages for this to work.

Those things aside though, this has been relatively straightforward compared to Tina. Once
`future`'s bodge interface was written, I just needed to edit the meson flags used by the
`gst_all_1.gstreamer` derivation to include all of our required plugins (rather than being separate
packages) (this is also a bodge solution until the gstreamer package(s) are actually fixed) by
modifying the `mesonFlags`. You can read more about this [here](#nixpkgs)!

# Go2RTC

<a href="https://github.com/AlexxIT/go2rtc" target="_blank">Go2RTC</a> is, according to their github,
"[a] camera streaming application with support RTSP, WebRTC, HomeKit, FFmpeg, RTMP, etc".

<p style="margin-bottom: 0rem;">We use it as the interface for various services employed by the doorbell to provide the services
you'd expect from such a device:</p>
- 2-way audio (WebRTC)
- 1-way audio-video stream (RTSP)
- 2-way video call, including audio (video is 1-way) (WebRTC)

Normally FFmpeg is used for various types of media and actions, but unfortunately while some
components of FFmpeg are available for RISC-V (such as SI-FIVE's assembly patch for x264),
fully-featured FFmpeg is not available for RISC-V. As such, we have to use GStreamer.

We have to write a custom interface for the the following:
- remote notifications when the button is pressed or motion is detected
- dial-in camera viewing

# Remote Server Architecture

Earlier here and elsewhere I said that we don't use the cloud, which is correct and truthful.
However, that does not mean we aren't running a server to manage contact initiations.

Here is what the server infrastructure looks like for a notification from the Iris doorbell to
a user's mobile device:

![Nucleus Labs' Server Infrastructure for Iris](/static/img/iris_server_out.png)

<p style="margin-bottom: 0;">
    Let's go through each of the steps one-by-one and go over what's happening:<br />
    <sub>This list is a high-level overview and very much subject to change.</sub>
</p>
1. An event occurs on the doorbell that is flagged for user notification
    1. Check what devices are configured to receive a notification for this event
    2. Grab the stored
       <a target="_blank" href="https://firebase.google.com/docs/projects/manage-installations">
           Firebase IDs
       </a>
       for those devices. Firebase is a service with a feature that enables mobile push notifications.
2. Send the list of Firebase IDs to the NL server for the Iris service.
    1. Open a web socket from the server to the requesting device.
    2. For each received Firebase ID, the server performs the following:
    3. Generate a UUID-4
    4. Associate that UUID-4 with the web socket using a Redis server
    5. Generate a message with a title and body. Body should include the UUID-4.
3. Dispatch the message to Firebase
4. Firebase forwards the message to the app instance with the corresponding Firebase ID
    1. Emit the message to the host OS as a push notification
    2. If the user follows up with the push notification, continue! Else end here.
5. App instance opens a connection to the NL server using the UUID-4 in the message body
    1. Find the open web-socket using the Redis server using the UUID-4 as the key
    2. Forward the connection request of the app instance through the web socket
6. The WebRTC handshake finishes with the doorbell responding, with the server handing control
   over the connection to the app instance
7. The app instance and doorbell can now communicate back and forth directly, securely
    1. ***The exact details of how the encryption and decryption are still being worked out***
