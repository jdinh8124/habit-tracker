CREATE TABLE "user" (
	"userId" serial NOT NULL,
	"userName" varchar(255) NOT NULL UNIQUE,
	"email" varchar(255) NOT NULL,
	"userPwd" varchar(255) NOT NULL,
	"createdAt" timestamptz NOT NULL,
	CONSTRAINT "user_pk" PRIMARY KEY ("userId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "habit" (
	"habitId" serial NOT NULL,
	"habitName" varchar(255) NOT NULL,
	"habitDescription" TEXT NOT NULL,
	"createdBy" serial NOT NULL,
	"createdAt" timestamptz NOT NULL,
	CONSTRAINT "habit_pk" PRIMARY KEY ("habitId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "routine" (
	"routineId" serial NOT NULL,
	"routineName" varchar(255) NOT NULL,
	"routineDescription" TEXT NOT NULL,
	"createdBy" serial NOT NULL,
	"createdAt" timestamptz NOT NULL,
	CONSTRAINT "routine_pk" PRIMARY KEY ("routineId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "chat" (
	"chatId" serial NOT NULL,
	"senderId" serial NOT NULL,
	"receiverId" serial NOT NULL,
	"message" TEXT NOT NULL,
	"createdAt" timestamptz NOT NULL,
	CONSTRAINT "chat_pk" PRIMARY KEY ("chatId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "routineHabit" (
	"routineId" serial NOT NULL,
	"habitId" serial NOT NULL,
	"createdAt" timestamptz NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "userRoutine" (
	"receiverId" serial NOT NULL,
	"senderId" serial NOT NULL,
	"routineId" serial NOT NULL,
	"routineName" varchar(255) NOT NULL,
	"accepted?" bool,
	"requestMessage" TEXT NOT NULL,
	"createdAt" timestamptz NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "userHabit" (
	"userId" serial NOT NULL,
	"routineId" serial NOT NULL,
	"habitId" serial NOT NULL,
	"timesCompleted" int NOT NULL DEFAULT '0',
	"lastCompleted" TIME NOT NULL,
	"frequency" int NOT NULL,
	"nextCompletion" DATE NOT NULL,
	"duration" varchar(255) NOT NULL,
	"congratsMessage" TEXT NOT NULL,
	"motivationalMessage" TEXT NOT NULL,
	"createdAt" timestamptz NOT NULL
) WITH (
  OIDS=FALSE
);




ALTER TABLE "habit" ADD CONSTRAINT "habit_fk0" FOREIGN KEY ("createdBy") REFERENCES "user"("userId");

ALTER TABLE "routine" ADD CONSTRAINT "routine_fk0" FOREIGN KEY ("createdBy") REFERENCES "user"("userId");

ALTER TABLE "chat" ADD CONSTRAINT "chat_fk0" FOREIGN KEY ("senderId") REFERENCES "user"("userId");
ALTER TABLE "chat" ADD CONSTRAINT "chat_fk1" FOREIGN KEY ("receiverId") REFERENCES "user"("userId");

ALTER TABLE "routineHabit" ADD CONSTRAINT "routineHabit_fk0" FOREIGN KEY ("routineId") REFERENCES "routine"("routineId");
ALTER TABLE "routineHabit" ADD CONSTRAINT "routineHabit_fk1" FOREIGN KEY ("habitId") REFERENCES "habit"("habitId");

ALTER TABLE "userRoutine" ADD CONSTRAINT "userRoutine_fk0" FOREIGN KEY ("receiverId") REFERENCES "user"("userId");
ALTER TABLE "userRoutine" ADD CONSTRAINT "userRoutine_fk1" FOREIGN KEY ("senderId") REFERENCES "user"("userId");
ALTER TABLE "userRoutine" ADD CONSTRAINT "userRoutine_fk2" FOREIGN KEY ("routineId") REFERENCES "routine"("routineId");

ALTER TABLE "userHabit" ADD CONSTRAINT "userHabit_fk0" FOREIGN KEY ("userId") REFERENCES "user"("userId");
ALTER TABLE "userHabit" ADD CONSTRAINT "userHabit_fk1" FOREIGN KEY ("routineId") REFERENCES "routine"("routineId");
ALTER TABLE "userHabit" ADD CONSTRAINT "userHabit_fk2" FOREIGN KEY ("habitId") REFERENCES "habit"("habitId");
