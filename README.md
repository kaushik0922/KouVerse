# KouVerse

React/Vite study dashboard for exam preparation.

## Features
- Dashboard, streaks, quiz improvement, Pomodoro and todos
- Timed mental-math quizzes
- Daily English words and smart phrases
- Spaced-repetition vocabulary review
- Editable syllabus tracker and quick notes
- Dark/light theme
- Supabase persistence with localStorage fallback

## Local
npm install
cp .env.example .env.local
npm run dev

## Supabase
Run supabase-schema.sql in Supabase SQL Editor, then set VITE_SUPABASE_URL and VITE_SUPABASE_PUBLISHABLE_KEY.

## Vercel
Import this repository into Vercel and add the two VITE_ environment variables.