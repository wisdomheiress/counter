# TCG Life Counter — Single HTML File for GitHub Pages

A two-player TCG counter board designed as a single `index.html` file, responsive for both portrait and landscape, deployable on GitHub Pages. Inspired by Riftbound rune aesthetics.

## User Review Required

> [!IMPORTANT]
> **Single file approach**: Everything (HTML, CSS, JS) will live in one `index.html` file so it works directly on GitHub Pages with zero build tooling. This also makes future APK wrapping (via WebView/iframe) trivial.

> [!IMPORTANT]
> **No external dependencies**: No frameworks, no CDN links — fully self-contained. The only external resource will be a Google Font import for typography (`Inter`). If you want zero external requests we can inline a system font stack instead.

## Open Questions

1. **XP Bar behavior** — The design mentions XP bars with `+` and `-` buttons starting at 0. Is there a maximum value, or is it unbounded? Should the bar visually fill up (progress bar style) or just show a number?
2. **Match points confirmation dialog** — You mentioned a dialog confirmation when scoring match points (arrows). Should this be a native `confirm()` dialog or a styled modal? A styled modal would look much nicer.
3. **Color persistence** — Should the chosen player colors survive a page reload (localStorage), or reset each time?
4. **Timer precision** — The chronometer shows MM:SS. Should it count *up* from 00:00 indefinitely, or is there a cap?
5. **Point Reset** - Do you want a way to reset all points/XP/match to zero (like a "New Game" button), or is that handled by just reloading the page?

## Proposed Changes

### Single file: `index.html`

#### [NEW] [`index.html`](file:///Users/violetaflorez/Proyectos/counter/index.html)

One self-contained HTML file with embedded `<style>` and `<script>` sections:

**Layout & Structure**
- Two player halves (opponent on top/left, player on bottom/right)
- CSS Grid for the overall board, switching layout via `@media (orientation: ...)`:
  - **Portrait**: stacked vertically (opponent top → timer middle → player bottom)
  - **Landscape**: side-by-side (opponent left → timer center column → player right)
- Opponent section is CSS `transform: rotate(180deg)` so text reads correctly from their side of the table
- Timer circle is always centered between the two halves

**Components per player half**:
| Element | Description |
|---------|-------------|
| **Points** | Large integer display with `+` / `-` buttons |
| **XP Bar** | Integer counter with `+` / `-` buttons |
| **Options (O)** | Button that opens an 8-color picker overlay |

**Shared center component**:
| Element | Description |
|---------|-------------|
| **Timer (T)** | Circular chronometer (MM:SS), tap to start/stop, double-tap to reset |
| **Match Score** | `X - Y` display with ↑/↓ arrows; each arrow press triggers a confirmation modal |

**Styling & Aesthetics**
- Color palette inspired by Riftbound rune cards:
  - 8 selectable colors drawn from the rune art: saturated jewel-toned versions of yellow, purple, blue, red, green, orange, black, white
  - Player default: warm gold (#C9A227 → amber gradient)
  - Opponent default: deep mauve/purple (#7B4FA0 → violet gradient)
- Dark background with subtle texture/grain
- Glassmorphism panels for each player half (frosted glass, subtle border glow matching player color)
- Smooth micro-animations: button press scale, counter value transitions, timer pulse
- Google Font `Inter` for clean modern typography
- Large touch-friendly buttons (min 48px tap targets)

**JavaScript Logic**
- State object per player: `{ points: 0, xp: 0, color: '...' }`
- Match state: `{ opponent: 0, player: 0 }`
- Timer: `setInterval`-based, tracking elapsed seconds, formatted as MM:SS
- Single-tap / double-tap detection on timer element via timeout differentiation
- Color picker: 8 swatches in an overlay, selecting updates CSS custom properties on that player's half
- Confirmation modal for match point changes (styled, not native)
- Responsive: only CSS media queries, no JS layout switching needed

**SEO / Meta**
- Proper `<title>`, `<meta name="description">`, viewport meta
- Semantic HTML5 (`<main>`, `<section>`, `<button>`, etc.)
- All interactive elements with unique IDs

## Verification Plan

### Manual Verification
- Open `index.html` directly in browser and test:
  - Portrait vs landscape (resize / rotate)
  - All counters increment/decrement
  - Timer start/stop/reset
  - Match score arrows + confirmation modal
  - Color picker for each player
  - Opponent text is upside-down
- Deploy to GitHub Pages and verify it loads correctly
