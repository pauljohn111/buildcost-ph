# BuildCost PH

Construction estimating workspace for Philippine residential projects. The first milestone is a responsive web prototype; mobile app work comes later.

## Included
- Overview dashboard and editable BOQ calculator
- Live subtotals and markup in PHP
- CSV export and print-friendly estimate
- Residential quantity takeoff library at `/quantity-takeoff`
- Manual quantity overrides and configurable allowances
- Starter Supabase schema
- Vercel configuration with a safe preview-to-production workflow

## Residential quantity takeoff
The takeoff library currently includes:
- Foundation excavation volume
- Concrete volume
- CHB wall net area
- Plastering area
- Floor tile area with wastage
- Painting area by coats
- Sloped roof surface estimate
- Pipe / conduit route length
- Reinforcing bar theoretical weight

These are preliminary geometric estimating aids, not engineered designs. Review dimensions, specifications, deductions, waste factors and code requirements. Sample rates are illustrative, not verified supplier quotations.

## Deploy on Vercel
The repository includes `vercel.json` for Next.js deployment. Connect `pauljohn111/buildcost-ph` to Vercel, set `main` as the Production Branch, and let pushes to `development-v0.2` create Preview Deployments. Review the preview before merging any changes into `main`.

See [Vercel deployment workflow](docs/VERCEL_DEPLOYMENT.md) for project settings, environment-variable guidance and the release checklist.

## Run locally
Requires Node.js 20.9 or newer.

```bash
npm install
npm run dev
```

Open http://localhost:3000. Open http://localhost:3000/quantity-takeoff for calculators.

## Important
The dashboard currently uses illustrative sample data held in browser state. It does not yet save to a database or authenticate users. Confirm local supplier prices, labor, freight, taxes and project specifications before using estimates commercially.
