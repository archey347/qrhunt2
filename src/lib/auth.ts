import "server-only";

import { drizzleAdapter } from "@better-auth/drizzle-adapter";
import { betterAuth } from "better-auth";
import { anonymous } from "better-auth/plugins";

import { db } from "@/db";
import { authSchema } from "@/db/schema";
import { getAuthSecret } from "./env";

export const auth = betterAuth({
  appName: "QR Hunt",
  baseURL:
    process.env.BETTER_AUTH_URL ??
    (process.env.NEXT_PHASE === "phase-production-build"
      ? "http://localhost:3000"
      : undefined),
  secret: getAuthSecret(),
  database: drizzleAdapter(db, {
    provider: "pg",
    schema: authSchema,
  }),
  emailAndPassword: {
    enabled: true,
  },
  plugins: [
    anonymous({
      emailDomainName: "anonymous.qrhunt.scoutslab.org.uk",
    })
  ]
});
