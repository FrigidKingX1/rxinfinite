# RXInfinite — DiRT Rally 2.0 Community Rallycross Server

A fork of [DirtForever](https://github.com/winrid/dirtforever) focused on **rallycross** clubs, events, and leaderboards. Run a small local server that intercepts the game's network calls and connects to your own web backend for clubs, leaderboards, and stage results.

---

## What's different from DirtForever

- Auto-generated daily/weekly events use **rallycross locations** (Hell, Höljes, Barcelona, etc.) and **RX car classes** (Supercars, Super 1600, RX2, etc.)
- Rallycross circuits are verified and playable in clubs
- UI is branded RXInfinite and centers on rallycross content
- Everything DirtForever does (clubs, leaderboards, stage submissions, vehicle select, repairs) works the same

---

## Quick Start

### 1. Deploy the web backend

**Option A: Railway (free, easiest)**

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new)

1. Push this repo to your GitHub
2. Connect Railway to the repo
3. Set environment variables (see below)

**Option B: VPS**

```bash
pip install flask flask-wtf gunicorn
cd web
gunicorn server:app --bind 0.0.0.0:5000 --workers 2
```

Set up nginx + certbot for SSL.

### 2. Set environment variables

Copy `web/.env.example` to `.env` and fill in:

| Variable | Required | Description |
|---|---|---|
| `SECRET_KEY` | Yes | Run `python -c "import secrets; print(secrets.token_hex(32))"` |
| `SITE_URL` | Yes | Your backend URL (e.g. `https://rxinfinite.railway.app`) |
| `SESSION_COOKIE_SECURE` | Yes | `true` if using HTTPS |
| `EMAIL_HOST*` | No | SMTP for email verification (skip for testing) |

### 3. Run the local proxy

**Windows:** Download the release, run it, paste your game token from the dashboard.
**Linux:** Same process via the Linux binary.
**From source:** `uv run python rxinfinite.py`

---

## For Developers

### Project layout

| Path | Purpose |
|---|---|
| `rxinfinite.py` | Desktop GUI + proxy launcher |
| `dr2server/` | EgoNet proxy server (MITM, protocol codec, RPC dispatch) |
| `web/` | Flask web frontend (the server players register at) |
| `scripts/` | Setup scripts (cert, hosts, installer) |
| `data/` | Upstream binary templates for stubs |

### Architecture

```
Game Client --EgoNet/HTTPS--> Local Proxy (dr2server) --REST--> Your Web Backend
```

### Deploy checklist

- [ ] Fork this repo
- [ ] Deploy `web/` to Railway or your VPS
- [ ] Set `SECRET_KEY` and `SITE_URL`
- [ ] Register a test account on your instance
- [ ] Generate a game token from the dashboard
- [ ] Build the local proxy exe (`python build_exe.py`) or run from source
- [ ] Run the proxy, enter your token, launch the game

---

### License

Same as DirtForever. DiRT Rally 2.0 is a trademark of Codemasters. RXInfinite is not affiliated with Codemasters or EA.
