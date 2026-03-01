# Massive Delete Gmail — GitHub Pages Site

Static website for the **Massive Delete Gmail** product: landing page, privacy policy, and terms of service.

## 📁 Structure

```
site/
├── index.html          # Landing page (Home)
├── privacy.html        # Privacy Policy
├── terms.html          # Terms of Service
├── 404.html            # Custom 404 page
├── styles.css          # Single stylesheet (zero dependencies)
├── favicon.svg         # SVG favicon
├── logo_official.svg   # Product logo (copy from project root)
├── robots.txt          # Search engine directives
├── sitemap.xml         # Sitemap for SEO
└── README.md           # This file
```

## 🚀 Publishing on GitHub Pages

### Step 1: Create a GitHub repository

1. Go to [github.com/new](https://github.com/new) and create a new repository (e.g., `massive-delete-gmail`).
2. Push the contents of the `site/` folder to the **root** of the `main` branch.

```bash
cd site
git init
git add .
git commit -m "Initial site deployment"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/massive-delete-gmail.git
git push -u origin main
```

### Step 2: Enable GitHub Pages

1. Go to the repository on GitHub.
2. Navigate to **Settings** → **Pages**.
3. Under **Source**, select **Deploy from a branch**.
4. Choose branch: **main**, folder: **/ (root)**.
5. Click **Save**.

Your site will be live at: `https://YOUR_USERNAME.github.io/massive-delete-gmail/`

### Step 3: Update placeholder URLs

Before publishing, search-and-replace these placeholders across all files:

| Placeholder | Replace with |
|---|---|
| `SEU_DOMINIO.com` | Your actual domain (e.g., `your-username.github.io/massive-delete-gmail`) |
| `support@SEU_DOMINIO.com` | Your actual support email |
| `[YOUR_JURISDICTION]` | Your country/state (in `terms.html` Section 9) |

You can do this quickly with:

```bash
# On Linux/macOS:
grep -rl "SEU_DOMINIO.com" . | xargs sed -i 's/SEU_DOMINIO.com/your-actual-domain.com/g'

# On Windows PowerShell:
Get-ChildItem -Recurse -Include *.html,*.xml,*.txt | ForEach-Object {
  (Get-Content $_.FullName) -replace 'SEU_DOMINIO\.com', 'your-actual-domain.com' | Set-Content $_.FullName
}
```

## 🖼️ Logo

The file `logo_official.svg` must be present in the same directory as the HTML files. Copy it from the project root if needed:

```bash
cp ../logo_official.svg .
```

## 🔗 Pages & Navigation

All pages link to each other via the top navbar and footer:

- **Home** → `index.html`
- **Privacy Policy** → `privacy.html`
- **Terms of Service** → `terms.html`
- **404** → `404.html` (auto-served by GitHub Pages)

## ✅ No Dependencies

- Zero external CSS/JS frameworks
- Zero CDN links
- Zero build steps
- Works offline after download
