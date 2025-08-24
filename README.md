# Ning Wang's Personal Website

A minimal academic personal website built with Pandoc and static HTML.

## TODO

Trivia and links don't work and GPT-5 doesn't know to debug? Check later

## Structure

- `content/` - Markdown source files for all pages
- `static/` - Static assets (CSS, images, favicon)
- `public/` - Generated HTML files (created by build script)
- `template.html` - Pandoc HTML template
- `build.sh` - Build all pages
- `publish.sh` - Build and publish to GitHub Pages
- `serve.sh` - Local development server

## Setup

1. **Add your photo**: Place a square photo as `static/ning-photo.jpg`
2. **Add favicon**: Create a 32x32px PNG as `static/favicon-32x32.png`
3. **Edit content**: Modify the markdown files in `content/` with your information
4. **Build**: Run `./build.sh` to generate HTML files
5. **Test locally**: Run `./serve.sh` and visit http://localhost:8080
6. **Deploy**: Set up GitHub Pages and run `./publish.sh`

## Required Dependencies

- `pandoc` - For converting Markdown to HTML
- `trash` - Safe file deletion (install with `brew install trash`)
- `npm` - For the local server

## Content Files

- `index.md` - Homepage with bio and contact
- `now.md` - Current activities and projects
- `publications.md` - Academic publications and talks
- `trivia.md` - Fun facts and personal interests
- `links.md` - Useful links and profiles

## Deployment

1. Create a GitHub repository for your website
2. Initialize git in the `public/` directory
3. Add your GitHub repository as origin
4. Run `./publish.sh` to build and deploy

## Customization

- Edit `static/style.css` for styling changes
- Modify `template.html` for layout changes
- All pages support KaTeX for math rendering
