import { hc } from "hono/client";

import type { AppType } from "@/server/api";

export const apiClient = hc<AppType>(
  typeof window === "undefined" ? "http://localhost:3000" : window.location.origin,
);
