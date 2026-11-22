# BuildCost PH

Construction estimating workspace for Philippine projects. The first milestone is a responsive web prototype; mobile app work comes later.

## Included in this starter
- Overview dashboard and BOQ calculator
- Editable quantities and unit costs with live totals
- Markup calculation and CSV export
- Starter Supabase schema for profiles, clients, projects, price items, BOQ items, and quotations

## Run locally
Requires Node.js 20.9 or newer.

```bash
npm install
npm run dev
```

Open http://localhost:3000.

## Supabase setup (optional at this stage)
1. Create a Supabase project.
2. Open the SQL Editor and run `supabase/schema.sql`.
3. Add your project URL and anon key to a local `.env.local` when the app's database integration is implemented.

## Important
The dashboard currently uses illustrative sample data held in browser state. It does not yet save to a database or authenticate users. Sample construction rates are not verified supplier quotations; confirm local prices, labor, freight, taxes, and project-specific specifications before using estimates commercially.

## Planned next milestones
1. Supabase authentication and persistent projects/BOQs
2. Philippine material and labor price library with source/date/location
3. Detailed quantity takeoff and estimate templates
4. Client quotation PDF and Excel exports
5. Mobile app after the web workflow is stable
