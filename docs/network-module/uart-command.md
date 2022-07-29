---
title: DigisynLink Network Module UART Command
tags:
  - UART
  - DL08
  - DL16
---

### Supported modules

This guide is applicable to network module such as DL08 and DL16.

### Revision History

| Date | Description of Changes |
| --- | --- |
| June 11, 2022 | Initial release of this document. |

### Preparation

- After power on the module, please wait for around 10 seconds. The module will then send `hello` via UART and listen to incoming commands.
- Each command should end with `\n`.
- UART means UART-A/rs232-A interface on mPCIe connector.
- UART configuration:

```bash
baudRate=115200, parity=none, dataBit=8, stopBit=1, no flow control
```

### Command List

| Command | Description | Return Value |
| --- | --- | --- |
| `hello` | Confirm module is working | iAm |
| `save` | Save configuration. New Configuration will be effective after restart | saved |
| `getCfg` | Get configuration | chNum_phyRx=8 <br> chNum_phyTx=8 <br> chNum_dspFromNet=0 <br> chNum_dspToNet=0 <br> sampleRate=48000 <br> fmt=tdm_2 <br> inv_lrclk=0 <br> inv_bclk=0 |
| `getSampleRateArr` | Get sample rate list | 48000,96000,192000 |
| `getFmtArr` | Get available I2S/TDM format | i2s_0,i2s_1,i2s_2,tdm_0,tdm_1,tdm_2,tdm_3,tdm_4 |
| `chNum_phyRx=8` | Set number of I2S input channel (If the module does not support DSP, this command also sets the number of network output channel) | None. [^1]  |
| `chNum_phyTx=8` | Set number of I2S output channel (If the module does not support DSP, this command also sets the number of network input channel) | None. [^1] |
| `chNum_dspFromNet=0` | Set number of network input channel (DSP Module Only) | None. [^1] |
| `chNum_dspToNet=0` | Set number of network output channel (DSP Module Only) | None. [^1] |
| `sampleRate=48000` | Set I2S sample rate | None. [^1] |
| `fmt=tdm_2` | Set I2S/TDM format | None. [^1] |
| `inv_lrclk=0` | Set I2S LRCLK polarity,  `=1` means inverted | None.[^1] |
| `inv_bclk=0` | Set I2S BCLK polarity inversion, `=1` means inverted | None. [^1] |

### Note

1. When using `192k` sample rate, please set I2S channel to `2 in 2 out`. Module currently does not support more channels under such sample rate.

[^1]: To confirm configuration, use `getCfg` Command