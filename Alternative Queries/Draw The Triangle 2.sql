SET @Number=0;
SELECT REPEAT("* ",@Number := @Number + 1)
FROM information_schema.tables LIMIT 20;

