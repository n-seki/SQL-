--題材A
--1.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座;

--2.
SELECT 口座番号
  FROM 口座;

--3.
SELECT 口座番号, 残高
  FROM 口座;

--4.
SELECT *
  FROM 口座;

--5.
UPDATE 口座
   SET 名義 = 'XXXXX';

--6.
UPDATE 口座
   SET 残高 = 99999, 更新日 = '2013-03-1';

--7. 8. 省略

--Level2
--9.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE 口座番号 = '00037651';

--10.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE 残高 > 0;

--11.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE 口座番号 < 10000;

--12.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE 更新日 < '2012-01-01';

--13.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE 残高 >= 1000000;

--14.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE 種別 <> '普通';

--15.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE 更新日 IS NULL;

--16.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE 名義 LIKE '%ハシ%';

--17.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE 更新日 BETWEEN '2013-01-01' AND '2013-01-31';

--18.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE 種別 IN('当座', '別段');

--19.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE 名義 = 'サカタ'
    OR 名義 = 'マツモト'
    OR 名義 = 'ハマダ';

--20.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE 更新日 BETWEEN '2012-12-30' AND '2013-01-04';

--21.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE 残高 < 10000
   AND 更新日 IS NOT NULL;

--22.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE (口座番号 LIKE '2______')
    OR (名義 LIKE 'エ_%コ');

--23 省略

--24.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
ORDER BY 口座番号;

--25.
 SELECT DISTINCT 名義
   FROM 口座
ORDER BY 名義;

--26.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
ORDER BY 4, 1;

--27.
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 WHERE 更新日 IS NOT NULL
ORDER BY 更新日
 LIMIT 10;

--28.
SELECT 更新日, 残高
  FROM 口座
 WHERE 残高 > 0
   AND 更新日 IS NOT NULL
ORDER BY 残高, 更新日 DESC
 LIMIT 10 OFFSET 10;

--29.
   SELECT 口座番号
     FROM 口座
UNION ALL 口座番号
     FROM 廃止口座
 ORDER BY 1;

 --30.
 SELECT 名義
   FROM 口座
  WHERE NOT EXISTS(
    SELECT 名義
      FROM 廃止口座
     WHERE 廃止口座.名義 = 口座.名義);

--31.
   SELECT 名義
     FROM 口座
INTERSECT 名義
     FROM 廃止口座
 ORDER BY 名義;

--32.
   SELECT 口座番号, 残高
     FROM 口座
    WHERE 残高 = 0
UNION ALL 口座番号, 残高
　   FROM 廃止口座
      AND 残高 <> 0
 ORDER BY 口座番号;

--33.
   SELECT 口座番号, 名義, '○'
     FROM 口座
UNION ALL 口座番号, 名義, '×'
     FROM 廃止口座;

--34.
SELECT 口座番号, 残高 / 1000 AS 千円単位の残高
  FROM 口座
WHERE 残高 >= 1000000;

--35. 省略

--36.
UPDATE 口座
   SET 残高 = (残高 - 3000) * 1.03
 WHERE 口座番号 IN('0652281', '1026413', '2239710');

--37.
SELECT 口座番号, 更新日, 更新日 + 180 AS 通帳期限日
  FROM 口座
 WHERE 更新日 <= '2011-12-31';

--38.
SELECT 口座番号, 'カ)' || 名義 AS 名義
  FROM 口座
 WHERE 種別 = '3';

--39.
SELECT 種別,
       CASE WHEN 種別 = '1' THEN '普通'
            WHEN 種別 = '2' THEN '当座'
            WHEN 種別 = '3' THEN '別段'
            ELSE NULL
        END AS 種別名
  FROM 口座;

--40.
SELECT 口座番号, 名義,
       CASE WHEN 残高 < 100000 THEN 'C'
            WHEN 残高 > 100000 AND 残高 < 1000000 THEN 'C'
            ELSE 'A'
       END AS 残高ランク
  FROM 口座;

--41.
SELECT 口座番号, TRIM(名義), 残高
  FROM 口座;

--42.
-- わかんない

--43.
-- わかんない

--44.
-- わかんない

--45.
--　わかんない

--46.省略

--47.
-- わかんない

--48.
SELECT
  CASE WHEN 更新日 IS NOT NULL THEN 更新日
       ELSE '設定なし'
  END AS 更新日
  FROM 口座;

--49.
SELECT SUM(残高) AS　合計,
       MAX(残高) AS 最大,
       MIN(残高) AS 最小,
       AVG(残高) AS 平均,
       COUNT(残高) AS 件数
  FROM 口座;

--50.
SELECT COUNT(*)
  FROM 口座
 WHERE 種別 <> '1'
   AND 残高 >= 1000000
   AND 更新日 < '2012-12-31';

--51.
SELECT COUNT(
  CASE WHEN 更新日 IS NOT NULL THEN 1
       ELSE 0 END)
  FROM 口座;

--52.
SELECT MAX(名義) AS　最大, MIN(名義) AS 最小
  FROM 口座;

--53.
SELECT MAX(更新日) AS 最大, MIN(更新日) AS 最小
  FROM 口座;

--54.
　SELECT 種別,
         SUM(残高) AS 合計,
         MAX(残高) AS 最大,
         MIN(残高) AS 最小,
         AVG(残高) AS 平均,
         COUNT(残高) AS 件数
　  FROM 口座
GROUP BY 種別;

--55.
SELECT COUNT(口座番号)
  FROM 口座
GROUP BY SUBSTRING(口座番号, LENGTH(口座番号) - 1, LENGTH(口座番号))
ORDER BY COUNT(口座番号);

--56.
SELECT
  FROM 口座
GROUP BY
  CASE WHEN 更新日 IS NOT NULL THEN SUBSTRING(更新日, 1, 4)
       ELSE 'XXXX'
   END;

--57.
SELECT SUM(残高) AS 残高,
       COUNT(*) AS 件数
  FROM 口座
ORDER BY 種別
HAVING SUM(残高) >= 3000000;

--58.
SELECT COUNT(*),
       AVG(LENGTH(REPLACE(名義, ' ', ''))
  FROM 口座
ORDER BY SUBSTRING(名義, 1, 1)
HAVING COUNT(*) >= 10
    OR AVG(LENGTH(REPLACE(名義, ' ', '')) >= 5;

--59.
UPDATE 口座
   SET 残高 = 残高 + (SELECT SUM(入金額) - SUM(出金額)
                       FROM 取引
                      WHERE 取引.口座番号 = 口座.口座番号
                        AND 取引日 = '2013-01-11')
 WHERE 口座番号 = '0351333';

 --60.
 SELECT 残高
        (SELECT SUM(入金額)
           FROM 取引
          WHERE 取引.口座番号 = 口座.口座番号
            AND 日付 = '2012-12-28') AS 入金額合計,
        (SELECT SUM(出金額)
           FROM 取引
          WHERE 取引.口座番号 = 口座.口座番号
            AND 日付 = '2012-12-28') AS 出金額合計
   FROM 口座
  WHERE 口座番号 = '0351333';

--61.
SELECT 口座番号, 名義, 残高
  FROM 口座
 WHERE 口座番号 IN(SELECT 口座番号
                    FROM 取引
                   WHERE 入金額 >= 1000000);

--62.
SELECT *
  FROM 口座
 WHERE 更新日 > ALL(SELECT 日付
                     FROM 取引);

--63.
SELECT 日付, MAX(入金額) AS 入金額合計, MAX(出金額) AS 出金額合計
  FROM 取引
 WHERE 口座番号 = '3104451';

--64.
INSERT INTO 廃止口座
     SELECT *
       FROM 口座
      WHERE 口座番号 = '2761055';
DELETE FROM 口座
      WHERE 口座番号 = '2761055';

--65
SELECT 取引.口座番号 AS 口座番号,
       取引.日付 AS 日付,
       取引事由.取引事由名 AS 取引事由,
       COALESCE(取引.入金額, 取引.出金額, 0) AS 取引金額
  FROM 取引 LEFT OUTER JOIN 取引事由
    ON 取引.取引事由ID = 取引事由.取引事由ID
 WHERE 取引.口座番号 IN ('0311240', '1234161', '2750902')
 ORDER BY 取引.口座番号, 取引番号;

 --66.
 SELECT K.口座番号 AS 口座番号,
        K.名義 AS 名義,
        K.残高 AS 残高,
        T.日付 AS 日付,
        T.入金額 AS 入金額,
        T.出金額 AS 出金額
   FROM 口座 K INNER JOIN 取引 T
     ON K.口座番号 = T.口座番号
  WHERE K.口座番号 = '0887132'
  ORDER BY T.日付;

--67.
SELECT K.口座番号, K.名義, K.残高
  FROM 口座 K
 WHERE EXISTS( SELECT *
                 FROM 取引 T
                WHERE T.日付 = '2011-03-01'
                  AND T.口座番号 = K.口座番号);

--68.
SELECT A.口座番号 AS 口座番号,
       A.名義 AS 名義,
       A.残高 AS 残高
  FROM (
         (SELECT K.口座番号 AS 口座番号,
                 K.名義 AS 名義,
                 K.残高 AS 残高
            FROM 口座 K)
         UNION ALL
         (SELECT H.口座番号 AS 口座番号,
                 '解約済み' AS 名義,
                 H.解約時残高 AS 残高
            FROM 廃止口座 H)
        ) A
 WHERE EXISTS(SELECT *
                 FROM 取引 T
                WHERE T.日付 = '2011-03-01'
                  AND A.口座番号 = T.口座番号);

--69.
SELECT T.取引番号 AS 取引番号,
       T.口座番号 AS 口座番号,
       CAST(T.取引事由ID AS VARCHAR) || ':' || TJ.取引事由名 AS 取引事由
  FROM 取引 T RIGHT OUTER JOIN 取引事由 TJ
    ON TJ.取引事由ID = T.取引事由ID;

--70.
SELECT DISTINCT COALESCE(T.取引事由ID, TJ.取引事由ID) AS 取引事由ID,
                COALESCE(TJ.取引事由名, '未登録の取引事由') AS 取引事由
  FROM 取引 T FULL OUTER JOIN 取引事由 TJ
    ON T.取引事由ID = TJ.取引事由ID;

--71.
SELECT K.口座番号 AS 口座番号,
       K.名義 AS 名義,
       K.残高 AS 残高,
       T.日付 AS 日付,
       T.入金額 AS 入金額,
       T.出金額 AS 出金額
  FROM 口座 K INNER JOIN 取引 T
    ON K.口座番号 = T.口座番号
             INNER JOIN 取引事由 TJ
    ON TJ.取引事由ID = T.取引事由ID
 WHERE K.口座番号 = '0887132'
 ORDER BY T.日付;

--72.
SELECT K.口座番号 AS 口座番号,
       K.名義 AS 名義,
       K.残高 AS 残高,
       T.日付 AS 日付,
       T.取引事由ID AS 取引事由ID,
       T.入金額 AS 入金額,
       T.出金額 AS 出金額
  FROM 口座 K INNER JOIN 取引 T
    ON T.口座番号 = K.口座番号
 WHERE K.残高 >= 5000000
   AND T.日付 >= '2013-01-01'
   AND (T.入金額 > 1000000 OR T.出金額 > 1000000);

--73.
SELECT K.口座番号 AS 口座番号,
       K.名義 AS 名義,
       K.残高 AS 残高,
       T.日付 AS 日付,
       T.取引事由ID AS 取引事由ID,
       T.入金額 AS 入金額,
       T.出金額 AS 出金額
  FROM 口座 K INNER JOIN (SELECT *
                           FROM 取引
                          WHERE 日付 >= '2013-01-01'
                            AND (入金額 >= 1000000 OR 出金額 >= 1000000)) T
    ON T.口座番号 = K.口座番号
 WHERE K.残高 >= 5000000;

 --74.
SELECT K.口座番号 AS 口座番号,
       C.回数 AS 回数,
       K.名義 AS 名義
  FROM 口座 K INNER JOIN(SELECT 口座番号,
                               COUNT(*) AS 回数
                          FROM 取引
                         GROUP BY 口座番号, 日付
                        HAVING COUNT(*) >= 3) C
    ON C.口座番号 = K.口座番号;

--75.
SELECT DISTINCT K1.名義 AS 名義,
                K1.口座番号 AS 口座番号,
                K1.種別 AS 種別
  FROM 口座 K1 INNER JOIN 口座 K2
    ON K1.名義 = K2.名義
   AND K1.口座番号 <> K2.口座番号
 ORDER BY K1.名義, K1.口座番号;
