create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text,
  company_name text,
  created_at timestamptz not null default now()
);

create table if not exists public.clients (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  email text,
  phone text,
  address text,
  created_at timestamptz not null default now()
);

create table if not exists public.projects (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  client_id uuid references public.clients(id) on delete set null,
  name text not null,
  location text,
  project_type text,
  status text not null default 'draft',
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.price_items (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade,
  category text not null,
  description text not null,
  unit text not null,
  unit_price numeric(14,2) not null default 0 check (unit_price >= 0),
  supplier text,
  location text,
  price_date date not null default current_date,
  is_public boolean not null default false,
  created_at timestamptz not null default now()
);

create table if not exists public.boq_items (
  id uuid primary key default gen_random_uuid(),
  project_id uuid not null references public.projects(id) on delete cascade,
  category text not null default 'General Requirements',
  description text not null,
  unit text not null,
  quantity numeric(14,3) not null default 0 check (quantity >= 0),
  unit_cost numeric(14,2) not null default 0 check (unit_cost >= 0),
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.quotations (
  id uuid primary key default gen_random_uuid(),
  project_id uuid not null references public.projects(id) on delete cascade,
  quotation_number text not null,
  markup_percent numeric(7,2) not null default 0,
  contingency_percent numeric(7,2) not null default 0,
  notes text,
  valid_until date,
  created_at timestamptz not null default now()
);

alter table public.clients enable row level security;
alter table public.projects enable row level security;
alter table public.price_items enable row level security;
alter table public.boq_items enable row level security;
alter table public.quotations enable row level security;

create policy "Users manage their clients" on public.clients for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Users manage their projects" on public.projects for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Users manage own and public price items" on public.price_items for select using (is_public = true or auth.uid() = user_id);
create policy "Users manage own price items" on public.price_items for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Users manage project BOQ items" on public.boq_items for all using (exists (select 1 from public.projects p where p.id = project_id and p.user_id = auth.uid())) with check (exists (select 1 from public.projects p where p.id = project_id and p.user_id = auth.uid()));
create policy "Users manage project quotations" on public.quotations for all using (exists (select 1 from public.projects p where p.id = project_id and p.user_id = auth.uid())) with check (exists (select 1 from public.projects p where p.id = project_id and p.user_id = auth.uid()));

create index if not exists projects_user_id_idx on public.projects(user_id);
create index if not exists boq_items_project_id_idx on public.boq_items(project_id);
create index if not exists price_items_category_idx on public.price_items(category);
