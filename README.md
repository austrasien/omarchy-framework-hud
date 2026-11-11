# Omarchy Framework HUD

Three [Omarchy](https://omarchy.org) shell plugins that frame the screen with a
HUD: the time down the left edge, the space down the right one, and what is
going on along the bottom. At rest each one is a thin rail, as wide as the gap
beside your windows; it deploys when you need it and never moves a window.

| Edge | Plugin | What it shows |
| --- | --- | --- |
| Left | [Day tape](https://github.com/austrasien/omarchy-daytape) | Today's calendar on a time scale: events as blocks, the hour you are in, a target-lock card on hover, warnings before a meeting, one click to join a call. |
| Right | [Day bar](https://github.com/austrasien/omarchy-daybar) | Your desks and their windows, the battery and Claude's usage limits; cards for coding agents that finish or wait on you, and for notifications, by the window they come from. |
| Bottom | [Day line](https://github.com/austrasien/omarchy-dayline) | The on-screen display (volume up to 200 %, screen and keyboard brightness), a dictation meter, and notifications as a news ticker. |

Each plugin lives in its own repository, linked here as a git submodule under
`plugins/`, and works on its own. Together they read as one frame: same
colours (the theme's accent), same cards, same animations.

## Made for the Framework Laptop 13

The three are built and tuned on a Framework Laptop 13 (and 13 Pro). They run
on any Omarchy machine, but this is where every pixel was checked:

- **The 3:2 panel at a fractional scale.** The rails are sized from Hyprland's
  `gaps_out` and lined up with the windows' borders to the pixel at 1.25 or 1.5
  scale, where a rounding error would otherwise show as a stray line. The tall
  3:2 screen gives the time scale and the desk list room to breathe.
- **The LEDs.** The day bar can drive the Caps Lock LED and the power button's
  fingerprint ring to tell you an agent finished or is waiting (`"leds": true`).
- **The keys.** The day line shows the keyboard backlight levels, and the day
  bar's cards show the keys that open a desk (Super+1…0, Super+Caps for the one
  calling you).
- **The battery.** The day bar's gauge reads UPower: level, hours left or to
  full, and the charge rate over time.

On another laptop the LEDs part simply stays off; everything else follows your
own gaps, scale and theme.

## Install

Each plugin installs on its own; this adds the three and enables them:

```sh
git clone --recurse-submodules https://github.com/austrasien/omarchy-framework-hud.git
cd omarchy-framework-hud
./install.sh
```

or, without cloning:

```sh
omarchy plugin add https://github.com/austrasien/omarchy-daytape.git --enable
omarchy plugin add https://github.com/austrasien/omarchy-daybar.git --enable
omarchy plugin add https://github.com/austrasien/omarchy-dayline.git --enable
```

Then hold Super to see the desk numbers: bind it as shown in the
[day bar's README](https://github.com/austrasien/omarchy-daybar#holding-super).

## What they lean on

None of this is needed to start; each plugin says what it is missing and does
without.

- **Day tape**: the calendars come from
  [omarchy-next-event](https://github.com/austrasien/omarchy-next-event).
- **Day bar**: the power chart from
  [omarchy-power](https://github.com/austrasien/omarchy-power), Claude's limits
  from [omarchy-agents](https://github.com/austrasien/omarchy-agents). Agent
  cards are fed by reporters; the author's are in the day bar's
  [`reporters/`](https://github.com/austrasien/omarchy-daybar/tree/main/reporters)
  (Claude Code hooks, summaries on a local model, Claude Code over ssh).
- **Day line**: the on-screen display through
  [Volume Overdrive](https://github.com/austrasien/omarchy-volume-overdrive),
  dictation from
  [nemotron-dictation](https://github.com/austrasien/nemotron-dictation), and
  the ticker from a notification service that speaks it (see its README).

## Updating

```sh
git pull --recurse-submodules
git submodule update --remote
omarchy restart shell
```

An installed plugin also updates on its own with `git pull` in
`~/.config/omarchy/plugins/<id>`.

## License

MIT, like each of the three plugins.
