import Link from "next/link";

const stack = [
  ["Next.js", "App Router with server-first React"],
  ["Drizzle + Neon", "Shared schema and typed Postgres access"],
  ["Hono + Zod", "Typed RPC routes with validated inputs"],
  ["Better Auth", "Email/password auth backed by Drizzle"],
] as const;

export default function Home() {
  return (
    <main className="mx-auto flex w-full max-w-5xl flex-1 flex-col justify-center px-6 py-16 sm:px-10">
      <div className="mb-12 max-w-2xl">
        <p className="mb-4 text-sm font-semibold uppercase tracking-[0.22em] text-blue-600">
          QR Hunt
        </p>
        <h1 className="text-4xl font-semibold tracking-tight text-slate-950 sm:text-6xl">
          One app. A shared type system.
        </h1>
        <p className="mt-6 max-w-xl text-lg leading-8 text-slate-600">
          The foundation is ready for product work: UI, RPC, authentication,
          and database code live together without duplicating your schema.
        </p>
      </div>

      <div className="grid gap-4 sm:grid-cols-2">
        {stack.map(([name, description]) => (
          <div
            key={name}
            className="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm"
          >
            <h2 className="font-semibold text-slate-950">{name}</h2>
            <p className="mt-2 text-sm leading-6 text-slate-600">{description}</p>
          </div>
        ))}
      </div>

      <div className="mt-8 flex flex-wrap gap-3 text-sm">
        <Link
          className="rounded-full bg-slate-950 px-5 py-3 font-medium text-white transition hover:bg-blue-700"
          href="/api/health"
        >
          Check API health
        </Link>
        <a
          className="rounded-full border border-slate-300 px-5 py-3 font-medium text-slate-700 transition hover:border-slate-950 hover:text-slate-950"
          href="https://orm.drizzle.team/docs/overview"
          target="_blank"
          rel="noreferrer"
        >
          Read the database docs
        </a>
      </div>
    </main>
  );
}
