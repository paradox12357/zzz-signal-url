# zzz-signal-url

A small Linux utility that extracts the **Zenless Zone Zero Signal Search history URL** for use with the [zzz.rng.moe](https://zzz.rng.moe/en/tracker/import) import tool.

This tool is based on [arch-fan's HSR Warp URL Extractor](https://gist.github.com/arch-fan/6876f063e3069f405a9e2e43d9346f1e).

## Requirements

* Linux
* Zenless Zone Zero

For automatic clipboard copying, one of the following is also required:

* `wl-clipboard`
* `xclip`
* `xsel`

## Usage

### Default Steam installation

Make the script executable:

```bash
chmod +x zzz-signal-url.sh
```

Run it without arguments:

```bash
./zzz-signal-url.sh
```

### Custom installation path

You can provide a different ZZZ installation directory as a command-line argument:

```bash
./zzz-signal-url.sh /path/to/ZenlessZoneZero\ Game
```

For example:

```bash
./zzz-signal-url.sh /mnt/games/Zenless\ Zone\ Zero/games/ZenlessZoneZero\ Game
```

### Run directly from GitHub

You can run the script directly without cloning the repository.

**Default Steam installation:**

```bash
curl -fsSL https://raw.githubusercontent.com/paradox12357/zzz-signal-url/main/zzz-signal-url.sh | bash
```

**Custom installation path:**

```bash
curl -fsSL https://raw.githubusercontent.com/paradox12357/zzz-signal-url/main/zzz-signal-url.sh | bash -s -- /path/to/Zenless\ Zone\ Zero/games/ZenlessZoneZero\ Game
```

The custom path should point to the `ZenlessZoneZero Game` directory.

## Getting the URL

1. Launch **Zenless Zone Zero**.
2. Open **Signal Search**.
3. Open **Records**.
4. Allow the records to load.
5. Run this script.
6. The extracted URL will be printed to the terminal and copied to your clipboard when a supported clipboard utility is available.

## Credits

This project is based on the cache-extraction approach used by **arch-fan's HSR Warp URL Extractor**:

https://gist.github.com/arch-fan/6876f063e3069f405a9e2e43d9346f1e

The HSR tool served as the basis for adapting the extraction process to the Zenless Zone Zero Steam installation and cache structure.

## Disclaimer

This project is an unofficial third-party utility and is not affiliated with HoYoverse or Zenless Zone Zero. Use at your own risk.
