CREATE TABLE "public.user" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"senha" TEXT NOT NULL,
	CONSTRAINT "user_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	"price" serial NOT NULL,
	"mainPicId" serial NOT NULL,
	"picsId" integer NOT NULL,
	"categoryId" integer NOT NULL,
	"sizeId" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.mainPic" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"productsId" integer NOT NULL,
	CONSTRAINT "mainPic_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.category" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pics" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"productsId" integer NOT NULL,
	CONSTRAINT "pics_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.size" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "size_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.order" (
	"id" serial NOT NULL,
	"status" TEXT NOT NULL,
	"date" serial NOT NULL,
	"userId" serial NOT NULL,
	"addId" DATE NOT NULL,
	"packageId" DATE NOT NULL,
	"productsId" integer NOT NULL,
	CONSTRAINT "order_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.add" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"cityId" integer NOT NULL,
	"orderId" integer NOT NULL,
	CONSTRAINT "add_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.city" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "city_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.package" (
	"id" serial NOT NULL,
	"quatity" integer NOT NULL,
	"totalPrice" integer NOT NULL,
	"orderId" integer NOT NULL,
	CONSTRAINT "package_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("mainPicId") REFERENCES "mainPic"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("picsId") REFERENCES "pics"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("categoryId") REFERENCES "category"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk3" FOREIGN KEY ("sizeId") REFERENCES "size"("id");

ALTER TABLE "mainPic" ADD CONSTRAINT "mainPic_fk0" FOREIGN KEY ("productsId") REFERENCES "products"("id");


ALTER TABLE "pics" ADD CONSTRAINT "pics_fk0" FOREIGN KEY ("productsId") REFERENCES "products"("id");


ALTER TABLE "order" ADD CONSTRAINT "order_fk0" FOREIGN KEY ("userId") REFERENCES "user"("id");
ALTER TABLE "order" ADD CONSTRAINT "order_fk1" FOREIGN KEY ("addId") REFERENCES "add"("id");
ALTER TABLE "order" ADD CONSTRAINT "order_fk2" FOREIGN KEY ("packageId") REFERENCES "package"("id");
ALTER TABLE "order" ADD CONSTRAINT "order_fk3" FOREIGN KEY ("productsId") REFERENCES "products"("id");

ALTER TABLE "add" ADD CONSTRAINT "add_fk0" FOREIGN KEY ("userId") REFERENCES "user"("id");
ALTER TABLE "add" ADD CONSTRAINT "add_fk1" FOREIGN KEY ("cityId") REFERENCES "city"("id");
ALTER TABLE "add" ADD CONSTRAINT "add_fk2" FOREIGN KEY ("orderId") REFERENCES "order"("id");


ALTER TABLE "package" ADD CONSTRAINT "package_fk0" FOREIGN KEY ("orderId") REFERENCES "order"("id");










