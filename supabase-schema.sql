create extension if not exists pgcrypto;
create table if not exists public.user_state (
 user_id uuid primary key references auth.users(id) on delete cascade,
 payload jsonb not null default '{}'::jsonb,
 updated_at timestamptz not null default now()
);
alter table public.user_state enable row level security;
drop policy if exists "Users manage own state" on public.user_state;
create policy "Users manage own state" on public.user_state for all to authenticated
using ((select auth.uid())=user_id) with check ((select auth.uid())=user_id);
grant select,insert,update,delete on public.user_state to authenticated;

create table if not exists public.quiz_attempts (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 quiz_type text not null, score integer not null, total integer not null,
 percent integer not null check(percent between 0 and 100),
 attempted_at timestamptz not null default now()
);
alter table public.quiz_attempts enable row level security;
drop policy if exists "Users manage own quiz attempts" on public.quiz_attempts;
create policy "Users manage own quiz attempts" on public.quiz_attempts for all to authenticated
using ((select auth.uid())=user_id) with check ((select auth.uid())=user_id);