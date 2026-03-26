-- Example RLS shape
alter table public.example enable row level security;

create policy "authenticated users can read own records"
on public.example
for select
to authenticated
using (user_id = auth.uid());

create policy "authenticated users can insert own records"
on public.example
for insert
to authenticated
with check (user_id = auth.uid());
