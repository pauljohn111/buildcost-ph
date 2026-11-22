# Vercel deployment workflow

BuildCost PH is a Next.js application and is configured for Vercel.

## Production and preview environments

- **Production branch:** `main`
- **Development branch:** `development-v0.2`
- Pushes to `main` create production deployments.
- Pushes to `development-v0.2` create Preview Deployments when the GitHub repository is connected to the Vercel project.
- Keep development work on `development-v0.2`. Do not merge or promote it to production until the preview has been checked.

## Connect or verify the Vercel project

1. Open the Vercel project dashboard for BuildCost PH.
2. Go to **Settings → Git**.
3. Confirm the connected repository is `pauljohn111/buildcost-ph`.
4. Confirm **Production Branch** is `main`.
5. Save settings if you changed them.
6. Open **Deployments** and inspect the latest deployment for `development-v0.2`. If no deployment appears, use **Deploy** / **Redeploy** and select the development branch, or push a new commit to that branch.

## Build settings

The repository's `vercel.json` declares the Next.js framework and standard npm install/build commands. In Vercel, leave the project root as `.` (repository root) and use the detected Next.js settings.

- Install: `npm install`
- Build: `npm run build`
- Output directory: leave blank / use the Next.js default.
- Node.js: use a supported LTS release configured in Project Settings. The app's documented local baseline is Node.js 20.9 or newer.

## Environment variables

The current estimator and quantity-takeoff pages run with local in-browser state and do not require Supabase environment variables to build. Supabase schema files are starter assets only; authentication and database persistence are not yet connected.

When Supabase integration is implemented, add the public project URL and anon/publishable key in **Settings → Environment Variables** for Preview and Production separately. Never put a Supabase service-role key in a browser-exposed `NEXT_PUBLIC_*` variable.

## Safe release process

1. Review the `development-v0.2` Preview Deployment.
2. Test the overview, manual BOQ editing, CSV export, print view, and `/quantity-takeoff` on desktop and mobile widths.
3. Fix issues on `development-v0.2` and verify the new preview.
4. Open a pull request from `development-v0.2` into `main`.
5. Merge only after review. Vercel then builds the production deployment from `main`.

A successful Vercel deployment confirms that the app built and was published; it does not validate construction formulas, rates, or commercial suitability.
