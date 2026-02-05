-- FINAL SUPABASE SCHEMA FOR CASHEW (PLATINUM TIER)
-- Version: 2.0 (Complete)
-- Includes: Personal Finance, Groups, Splitwise Features, Activity Feed, Storage, and RLS.

-- 1. EXTENSIONS
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 2. HELPER FUNCTIONS
-- Check if the current user is a member of the given group
CREATE OR REPLACE FUNCTION is_group_member(_group_pk UUID)
RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1
    FROM public.group_members
    WHERE group_fk = _group_pk
    AND user_id = auth.uid()
    AND is_active = true
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- --------------------------------------------------------
-- PERSONAL FINANCE TABLES
-- --------------------------------------------------------

-- Wallets
CREATE TABLE IF NOT EXISTS public.wallets (
    wallet_pk UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    amount NUMERIC DEFAULT 0,
    currency TEXT NOT NULL,
    colour TEXT,
    icon_name TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    datetime_modified TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    "order" INTEGER DEFAULT 0,
    user_id UUID REFERENCES auth.users(id) NOT NULL
);
ALTER TABLE public.wallets ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users can manage their own wallets" ON public.wallets;
CREATE POLICY "Users can manage their own wallets" ON public.wallets
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

-- Categories
CREATE TABLE IF NOT EXISTS public.categories (
    category_pk UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    colour TEXT,
    icon_name TEXT,
    emoji_icon_name TEXT,
    income BOOLEAN DEFAULT false,
    "order" INTEGER DEFAULT 0,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    datetime_modified TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    main_category_pk UUID REFERENCES public.categories(category_pk),
    user_id UUID REFERENCES auth.users(id) NOT NULL
);
ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users can manage their own categories" ON public.categories;
CREATE POLICY "Users can manage their own categories" ON public.categories
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

-- Transactions
CREATE TABLE IF NOT EXISTS public.transactions (
    transaction_pk UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT,
    amount NUMERIC DEFAULT 0,
    note TEXT,
    category_fk UUID REFERENCES public.categories(category_pk),
    wallet_fk UUID REFERENCES public.wallets(wallet_pk),
    date_created TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    datetime_modified TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    income BOOLEAN DEFAULT false,
    paid BOOLEAN DEFAULT false,
    skip_paid BOOLEAN DEFAULT false,
    user_id UUID REFERENCES auth.users(id) NOT NULL
);
ALTER TABLE public.transactions ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users can manage their own transactions" ON public.transactions;
CREATE POLICY "Users can manage their own transactions" ON public.transactions
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

-- Budgets
CREATE TABLE IF NOT EXISTS public.budgets (
    budget_pk UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    amount NUMERIC DEFAULT 0,
    start_date TIMESTAMP WITH TIME ZONE,
    end_date TIMESTAMP WITH TIME ZONE,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    datetime_modified TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    "order" INTEGER DEFAULT 0,
    wallet_fk UUID REFERENCES public.wallets(wallet_pk),
    user_id UUID REFERENCES auth.users(id) NOT NULL
);
ALTER TABLE public.budgets ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users can manage their own budgets" ON public.budgets;
CREATE POLICY "Users can manage their own budgets" ON public.budgets
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

-- Objectives (Goals)
CREATE TABLE IF NOT EXISTS public.objectives (
    objective_pk UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    amount NUMERIC DEFAULT 0,
    "order" INTEGER DEFAULT 0,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    datetime_modified TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    user_id UUID REFERENCES auth.users(id) NOT NULL
);
ALTER TABLE public.objectives ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users can manage their own objectives" ON public.objectives;
CREATE POLICY "Users can manage their own objectives" ON public.objectives
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

-- --------------------------------------------------------
-- GROUP COLLABORATION TABLES (SPLITWISE FEATURES)
-- --------------------------------------------------------

-- Groups
CREATE TABLE IF NOT EXISTS public.groups (
    group_pk UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    description TEXT,
    image_url TEXT,
    created_by UUID REFERENCES auth.users(id),
    date_created TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    datetime_modified TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    archived BOOLEAN DEFAULT false
);
ALTER TABLE public.groups ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Members can view groups" ON public.groups;
CREATE POLICY "Members can view groups" ON public.groups FOR SELECT
    USING (is_group_member(group_pk));

DROP POLICY IF EXISTS "Users can create groups" ON public.groups;
CREATE POLICY "Users can create groups" ON public.groups FOR INSERT
    WITH CHECK (auth.uid() = created_by);

DROP POLICY IF EXISTS "Members can update groups" ON public.groups;
CREATE POLICY "Members can update groups" ON public.groups FOR UPDATE
    USING (is_group_member(group_pk));


-- Group Members
CREATE TABLE IF NOT EXISTS public.group_members (
    member_pk UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    group_fk UUID REFERENCES public.groups(group_pk) ON DELETE CASCADE,
    user_email TEXT NOT NULL,
    user_name TEXT,
    user_photo_url TEXT,
    date_joined TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    is_active BOOLEAN DEFAULT true,
    user_id UUID REFERENCES auth.users(id) -- Nullable for invited users not yet signed up
);
ALTER TABLE public.group_members ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Members can view group members" ON public.group_members;
CREATE POLICY "Members can view group members" ON public.group_members FOR SELECT
    USING (is_group_member(group_fk));

-- Allow users to add themselves (when creating) or others (invites)
DROP POLICY IF EXISTS "Users can add members" ON public.group_members;
CREATE POLICY "Users can add members" ON public.group_members FOR INSERT
    WITH CHECK (auth.uid() IS NOT NULL);


-- Shared Expenses
CREATE TABLE IF NOT EXISTS public.shared_expenses (
    expense_pk UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    group_fk UUID REFERENCES public.groups(group_pk) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT,
    amount NUMERIC DEFAULT 0,
    currency TEXT NOT NULL,
    category_fk UUID, 
    paid_by TEXT NOT NULL, -- Email
    paid_by_user_id UUID REFERENCES auth.users(id),
    date_created TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    datetime_modified TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
    image_url TEXT,
    is_settled BOOLEAN DEFAULT false
);
ALTER TABLE public.shared_expenses ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Members can view shared expenses" ON public.shared_expenses;
CREATE POLICY "Members can view shared expenses" ON public.shared_expenses FOR SELECT
    USING (is_group_member(group_fk));

DROP POLICY IF EXISTS "Members can add shared expenses" ON public.shared_expenses;
CREATE POLICY "Members can add shared expenses" ON public.shared_expenses FOR INSERT
    WITH CHECK (is_group_member(group_fk));

DROP POLICY IF EXISTS "Members can update shared expenses" ON public.shared_expenses;
CREATE POLICY "Members can update shared expenses" ON public.shared_expenses FOR UPDATE
    USING (is_group_member(group_fk));

DROP POLICY IF EXISTS "Members can delete shared expenses" ON public.shared_expenses;
CREATE POLICY "Members can delete shared expenses" ON public.shared_expenses FOR DELETE
    USING (is_group_member(group_fk));


-- Expense Splits
CREATE TABLE IF NOT EXISTS public.expense_splits (
    split_pk UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    expense_fk UUID REFERENCES public.shared_expenses(expense_pk) ON DELETE CASCADE,
    user_email TEXT NOT NULL,
    share_amount NUMERIC DEFAULT 0,
    paid_amount NUMERIC DEFAULT 0,
    is_settled BOOLEAN DEFAULT false
);
ALTER TABLE public.expense_splits ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Members can view splits" ON public.expense_splits;
CREATE POLICY "Members can view splits" ON public.expense_splits FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM public.shared_expenses se
            WHERE se.expense_pk = expense_fk
            AND is_group_member(se.group_fk)
        )
    );

DROP POLICY IF EXISTS "Members can add splits" ON public.expense_splits;
CREATE POLICY "Members can add splits" ON public.expense_splits FOR INSERT
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM public.shared_expenses se
            WHERE se.expense_pk = expense_fk
            AND is_group_member(se.group_fk)
        )
    );


-- Settlements
CREATE TABLE IF NOT EXISTS public.settlements (
    settlement_pk UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    group_fk UUID REFERENCES public.groups(group_pk) ON DELETE CASCADE,
    from_user_email TEXT NOT NULL,
    to_user_email TEXT NOT NULL,
    amount NUMERIC DEFAULT 0,
    currency TEXT NOT NULL,
    payment_method TEXT,
    notes TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);
ALTER TABLE public.settlements ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Members can view settlements" ON public.settlements;
CREATE POLICY "Members can view settlements" ON public.settlements FOR SELECT
    USING (is_group_member(group_fk));

DROP POLICY IF EXISTS "Members can add settlements" ON public.settlements;
CREATE POLICY "Members can add settlements" ON public.settlements FOR INSERT
    WITH CHECK (is_group_member(group_fk));


-- Group Activity (Notifications Feed)
CREATE TABLE IF NOT EXISTS public.group_activity (
    activity_pk UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    group_fk UUID REFERENCES public.groups(group_pk) ON DELETE CASCADE,
    activity_type TEXT NOT NULL,
    performed_by TEXT NOT NULL,
    description TEXT,
    related_expense_fk UUID REFERENCES public.shared_expenses(expense_pk) ON DELETE SET NULL,
    related_settlement_fk UUID REFERENCES public.settlements(settlement_pk) ON DELETE SET NULL,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);
ALTER TABLE public.group_activity ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Members can view activity" ON public.group_activity;
CREATE POLICY "Members can view activity" ON public.group_activity FOR SELECT
    USING (is_group_member(group_fk));

DROP POLICY IF EXISTS "Members can add activity" ON public.group_activity;
CREATE POLICY "Members can add activity" ON public.group_activity FOR INSERT
    WITH CHECK (is_group_member(group_fk));


-- --------------------------------------------------------
-- STORAGE POLICIES
-- --------------------------------------------------------

-- Ensure 'attachments' bucket exists
INSERT INTO storage.buckets (id, name, public) VALUES ('attachments', 'attachments', true)
ON CONFLICT (id) DO NOTHING;

-- Policy: Allow authenticated users to upload receipts/images
CREATE POLICY "Authenticated users can upload attachments" ON storage.objects
    FOR INSERT 
    WITH CHECK (
        bucket_id = 'attachments' AND 
        auth.role() = 'authenticated'
    );

-- Policy: Allow anyone (or just members) to view attachments
-- For simplicity in a PWA, public read is often acceptable for receipt images, 
-- but restricting to auth uses is better.
CREATE POLICY "Authenticated users can view attachments" ON storage.objects
    FOR SELECT
    USING (bucket_id = 'attachments' AND auth.role() = 'authenticated');

-- Indexes for Performance
CREATE INDEX IF NOT EXISTS idx_group_members_user_id ON public.group_members(user_id);
CREATE INDEX IF NOT EXISTS idx_group_members_group_fk ON public.group_members(group_fk);
CREATE INDEX IF NOT EXISTS idx_shared_expenses_group_fk ON public.shared_expenses(group_fk);
CREATE INDEX IF NOT EXISTS idx_group_activity_group_fk ON public.group_activity(group_fk);
