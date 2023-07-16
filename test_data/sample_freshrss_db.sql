BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "entry" (
	"id"	BIGINT NOT NULL,
	"guid"	VARCHAR(760) NOT NULL,
	"title"	VARCHAR(255) NOT NULL,
	"author"	VARCHAR(255),
	"content"	TEXT,
	"link"	VARCHAR(1023) NOT NULL,
	"date"	INT(11),
	"lastSeen"	INT(11) DEFAULT 0,
	"hash"	BINARY(16),
	"is_read"	BOOLEAN NOT NULL DEFAULT 0,
	"is_favorite"	BOOLEAN NOT NULL DEFAULT 0,
	"id_feed"	INTEGER,
	"tags"	VARCHAR(1023),
	"attributes"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("id_feed") REFERENCES "feed"("id") ON DELETE CASCADE ON UPDATE CASCADE,
	UNIQUE("id_feed","guid")
);
INSERT INTO "entry" VALUES (1689512683138069,'https://sourceforge.net/projects/opencamera/files/v_1_31/OpenCamera.apk/download','/v_1_31/OpenCamera.apk','','/v_1_31/OpenCamera.apk','https://sourceforge.net/projects/opencamera/files/v_1_31/OpenCamera.apk/download',1466807280,1689512680,'9a58c8421ab905ee88fdd535aa8c8dc8',0,0,27,'','{"enclosures":[{"url":"https://sourceforge.net/projects/opencamera/files/v_1_31/OpenCamera.apk/download","type":"application/zip; charset=binary"}]}');
INSERT INTO "entry" VALUES (1689512683138104,'yt:video:ejkHVAgzQ7U','P90.',';Ahoy','','https://www.youtube.com/watch?v=ejkHVAgzQ7U',1492787040,1689512676,'b22937e575be303980e3d7bfb594fabf',0,0,74,'','{"enclosures":[{"url":"https://www.youtube.com/v/ejkHVAgzQ7U?version=3","title":"P90.","description":"Next up: POLYBIUS.\nPatreon: https://www.patreon.com/ahoy","type":"application/x-shockwave-flash","height":390,"width":640,"thumbnails":["https://i2.ytimg.com/vi/ejkHVAgzQ7U/hqdefault.jpg"]}]}');
INSERT INTO "entry" VALUES (1689512683139551,'t3_14zbceu','ISRO''s Chandrayaan-3 successfully launched',';／u／shrigay','<table> <tr><td> <a href="https://old.reddit.com/r/india/comments/14zbceu/isros_chandrayaan3_successfully_launched/"> <img src="https://preview.redd.it/ixcfga4xcwbb1.png?width=640&amp;crop=smart&amp;auto=webp&amp;s=3674b48cddc09051d011b6664db57445a752cbb3" alt="ISRO''s Chandrayaan-3 successfully launched" title="ISRO''s Chandrayaan-3 successfully launched"> </a> </td><td>   submitted by   <a href="https://old.reddit.com/user/shrigay"> /u/shrigay </a>   to   <a href="https://old.reddit.com/r/india/"> r/india </a> <br> <span><a href="https://i.redd.it/ixcfga4xcwbb1.png">[link]</a></span>   <span><a href="https://old.reddit.com/r/india/comments/14zbceu/isros_chandrayaan3_successfully_launched/">[comments]</a></span> </td></tr></table>','https://old.reddit.com/r/india/comments/14zbceu/isros_chandrayaan3_successfully_launched/',1689325800,1689512676,'1d4b1019f61a2730284f73a2619eb953',0,0,71,'#r/india','{"thumbnail":{"url":"https://preview.redd.it/ixcfga4xcwbb1.png?width=640&amp;crop=smart&amp;auto=webp&amp;s=3674b48cddc09051d011b6664db57445a752cbb3"},"enclosures":[]}');
CREATE INDEX IF NOT EXISTS "entry_is_favorite_index" ON "entry" (
	"is_favorite"
);
CREATE INDEX IF NOT EXISTS "entry_is_read_index" ON "entry" (
	"is_read"
);
CREATE INDEX IF NOT EXISTS "entry_lastSeen_index" ON "entry" (
	"lastSeen"
);
CREATE INDEX IF NOT EXISTS "entry_feed_read_index" ON "entry" (
	"id_feed",
	"is_read"
);
COMMIT;