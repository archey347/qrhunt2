CREATE TABLE "game_admins" (
	"id" text PRIMARY KEY NOT NULL,
	"game_id" text NOT NULL,
	"user_id" text NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "games" (
	"id" text PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"status" text DEFAULT 'draft' NOT NULL,
	"pause_reason" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "qr_code_scans" (
	"id" text PRIMARY KEY NOT NULL,
	"qr_code_id" text NOT NULL,
	"team_id" text NOT NULL,
	"user_id" text NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "qr_codes" (
	"id" text PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"hint" text NOT NULL,
	"latitude" text,
	"longitude" text,
	"code" text NOT NULL,
	"game_id" text NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "qr_codes_code_unique" UNIQUE("code")
);
--> statement-breakpoint
CREATE TABLE "team_memberships" (
	"id" text PRIMARY KEY NOT NULL,
	"team_id" text NOT NULL,
	"user_id" text NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "teams" (
	"id" text PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"game_id" text NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "game_admins" ADD CONSTRAINT "game_admins_game_id_games_id_fk" FOREIGN KEY ("game_id") REFERENCES "public"."games"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "game_admins" ADD CONSTRAINT "game_admins_user_id_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "qr_code_scans" ADD CONSTRAINT "qr_code_scans_qr_code_id_qr_codes_id_fk" FOREIGN KEY ("qr_code_id") REFERENCES "public"."qr_codes"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "qr_code_scans" ADD CONSTRAINT "qr_code_scans_team_id_teams_id_fk" FOREIGN KEY ("team_id") REFERENCES "public"."teams"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "qr_code_scans" ADD CONSTRAINT "qr_code_scans_user_id_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "qr_codes" ADD CONSTRAINT "qr_codes_game_id_games_id_fk" FOREIGN KEY ("game_id") REFERENCES "public"."games"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "team_memberships" ADD CONSTRAINT "team_memberships_team_id_teams_id_fk" FOREIGN KEY ("team_id") REFERENCES "public"."teams"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "team_memberships" ADD CONSTRAINT "team_memberships_user_id_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "teams" ADD CONSTRAINT "teams_game_id_games_id_fk" FOREIGN KEY ("game_id") REFERENCES "public"."games"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "game_admins_game_id_idx" ON "game_admins" USING btree ("game_id");--> statement-breakpoint
CREATE INDEX "game_admins_user_id_idx" ON "game_admins" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX "games_name_idx" ON "games" USING btree ("name");--> statement-breakpoint
CREATE INDEX "qr_code_scans_qr_code_id_idx" ON "qr_code_scans" USING btree ("qr_code_id");--> statement-breakpoint
CREATE INDEX "qr_code_scans_team_id_idx" ON "qr_code_scans" USING btree ("team_id");--> statement-breakpoint
CREATE INDEX "qr_code_scans_user_id_idx" ON "qr_code_scans" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX "qr_codes_game_id_idx" ON "qr_codes" USING btree ("game_id");--> statement-breakpoint
CREATE INDEX "team_memberships_team_id_idx" ON "team_memberships" USING btree ("team_id");--> statement-breakpoint
CREATE INDEX "team_memberships_user_id_idx" ON "team_memberships" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX "teams_game_id_idx" ON "teams" USING btree ("game_id");