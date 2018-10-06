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


 --題材B
 --1.
 SELECT 商品コード,
        商品名,
        単価,
        商品区分,
        関連商品コード
   FROM 商品;

--2.
SELECT 商品名
  FROM 商品;

--3.
SELECT *
  FROM 注文;

--4.
SELECT 注文番号,
       注文枝番,
       商品コード
  FROM 注文;

--5.省略

--6.
SELECT *
  FROM 商品
 WHERE 商品コード = 'W1252';

--7.
UPDATE 商品
   SET 単価 = 500
 WHERE 商品コード = 'S0023';

--8.
SELECT *
  FROM 商品
 WHERE 単価 <= 1000;

--9.
SELECT *
  FROM 商品
 WHERE 単価 >= 50000;

--10.
SELECT *
  FROM 注文
 WHERE 注文日 >= '2013-01-01';

--11.
SELECT *
  FROM 注文
 WHERE 注文日 < '2012-11-01';

--12.
SELECT *
  FROM 商品
 WHERE 商品区分 <> '1';

--13.
SELECT *
  FROM 注文
 WHERE クーポン割引料 IS NULL;

--14.
DELETE FROM 商品
 WHERE 商品コード LIKE 'N%';

--15.
SELECT 商品コード,
       商品名,
       単価
  FROM 商品
 WHERE 商品名 LINE '%コート%';

--16.
SELECT 商品コード,
       商品区分
  FROM 商品
 WHERE 商品区分 IN('2', '3', '9');

--17.
SELECT *
  FROM 商品
 WHERE 商品コド BETWEEN 'A0100' AND 'A0105';

--18.
SELECT *
  FROM 注文
 WHERE 商品コード IN('N0501', 'N1021', 'N0223');

--19.
SELECT *
  FROM 商品
 WHERE 商品区分 = '9'
   AND 商品名 LIKE '%水玉%';

--20.
SELECT *
  FROM 商品
 WHERE 商品名 LIKE '%軽い%'
    OR 商品名 LIKE '%ゆるふわ%';

--21.
SELECT *
  FROM 商品
 WHERE (商品区分 = '1' AND 単価 <= 3000)
    OR (商品区分 = '9' AND 単価 >= 10000);

--22.
SELECT 商品コード
  FROM 注文
 WHERE 注文日 >= '2013-03-01' AND 注文日 < '2013-04-01'
   AND 数量 >= 3;

--23.
SELECT *
  FROM 注文
 WHERE 数量 >= 10
    OR クーポン利用料 IS NOT NULL;

--24.省略

--25.
SELECT 商品コード,
       商品名
  FROM 商品
 WHERE 商品区分 = '1'
 ORDER BY 商品コード DESC;

--26.
SELECT 注文日,
       注文番号,
       注文枝番,
       商品コード,
       数量
  FROM 注文
 WHERE 注文日 >= '2013-03-01'
 ORDER BY 1, 2, 3;

--27.
SELECT DISTINCT 商品コード
  FROM 注文
 ORDER BY 商品コード;

--28.
SELECT 注文日
  FROM 注文
 ORDER BY 注文日 DESC
 LIMIT 10;

--29.
SELECT *
  FROM 商品
 ORDER BY 単価, 商品区分, 商品コード
 LIMIT 15 OFFSET 6;

--30.
SELECT
  FROM 廃番商品
 WHERE 廃番日 >= '2011-12-01' AND 廃番日 < '2012-01-01'
    OR 売上個数 >= 100
 ORDER BY 売上個数 DESC;

--31.
SELECT 商品コード
  FROM 商品 S
 WHERE NOT EXISTS (SELECT *
                     FROM 注文 T
                    WHERE T.商品コード = S.商品コード)
 ORDER BY 商品コード;

--32.
SELECT 商品コード
  FROM 商品 S
 WHERE EXISTS (SELECT *
                 FROM 注文 T
                WHERE T.商品コード = S.商品コード)
 ORDER BY 商品コード DESC;

--33.
SELECT 商品コード,
       商品名,
       単価
  FROM 商品
 WHERE 商品区分 = '9'
   AND (単価 <= 1000 OR 単価 > 10000)
 ORDER BY 単価, 商品コード;

--34.
SELECT 商品コード,
       単価,
       TRUNC(単価 * 0.95) AS キャンペーン価格
  FROM 商品
 WHERE 商品区分 = '9'
 ORDER BY 商品コード;

--35.
UPDATE 注文
   SET クーポン割引料 = クーポン割引料 + 300
 WHERE 注文日 BETWEEN '2013-03-12' AND '2013-03-14'
   AND 数量 >= 2
   AND クーポン割引料 IS NOT NULL;

--36.
UPDATE 注文
   SET 数量 = 数量 - 1
 WHERE 注文番号 = '201302250126';

 --37.
 SELECT 注文番号 || '-' || 注文枝番 AS 注文番号
   FROM 注文
  WHERE 注文番号 BETWEEN '201210010001' AND '201210319999';

--38.
SELECT DISTINCT
       商品区分 AS 区分,
       CASE WHEN 商品区分 = '1' THEN '衣類'
            WHEN 商品区分 = '2' THEN '靴'
            WHEN 商品区分 = '3' THEN '雑貨'
            WHEN 商品区分 = '9' THEN '未分類'
            ELSE '該当区分名なし'
       END AS 区分名
  FROM 商品;

--39.
SELECT 商品コード,
       商品名,
       単価,
       CASE WHEN 単価 < 3000 THEN 'S'
            WHEN 単価 >= 3000 AND 単価 < 10000 THEN 'M'
            WHEN 単価 >= 10000 'L'
            ELSE NULL
       END AS 販売価格ランク,
       商品区分
  FROM 商品
 ORDER BY 単価, 商品コード;

 --40.
 SELECT 商品名,
        LENGTH(商品名) AS 文字数
   FROM 商品
  WHERE LENGTH(商品名) > 10
  ORDER BY LENGTH(商品名);

--41.
SELECT 注文日,
       SUBSTRING(注文番号, 9, 4) AS 注文番号
  FROM 注文;

--42.
UPDATE 商品
   SET 商品コード = REPLACE(商品コード, 'M', 'E')
 WHERE 商品コード LIKE 'M%';

 UPDATE 商品
    SET 商品コード = 'E' || SUBSTRING(商品コード, 2, 4)
  WHERE 商品コード LIKE 'M%';

--43.
SELECT SUBSTRING(注文番号, 9, 4) AS 連番
  FROM 注文
 WHERE SUBSTRING(注文番号, 9, 4) BETWEEN '1000' AND '2000'
 ORDER BY SUBSTRING(注文番号, 9, 4);

--44.省略

--45.
SELECT 商品コード,
       商品名,
       単価,
       TRUNC(単価 * 0.7) AS 値下げした単価
  FROM 商品
 WHERE 単価 >= 10000;

--46.
SELECT SUM(数量) AS 合計
  FROM 注文;

--47.
SELECT 日付,
       SUM(数量) AS 合計
  FROM 注文
 GROUP BY 注文日

--48.
SELECT MIN(価格) AS 最小価格,
       MAX(価格) AS 最大価格
  FROM 商品
 GROUP BY 商品区分;

--49.
SELECT SUM(数量) AS 合計
  FROM 注文
 GROUP BY 商品コード;

--50.
SELECT A.商品コード AS 商品コード,
       A.合計 AS 合計
 FROM (SELECT 商品コード,
              SUM(数量) AS 合計
         FROM 注文
         GROUP BY 商品コード) A
ORDER BY A.合計 DESC, A.商品コード
LIMIT 10;

--51.
SELECT 商品コード,
       SUM(数量) AS 数量
  FROM 注文
 GROUP BY 商品コード
HAVING SUM(数量) < 5;

--52.
SELECT COUNT(CASE WHEN クーポン割引料 IS NOT NULL THEN 1
                  ELSE 0
             END) AS クーポン割引合計回数,
       SUM(CASE WHEN クーポン割引料 IS NOT NULL THEN クーポン割引料
                ELSE 0
           END) AS クーポン割引合計
  FROM 注文;

--53.
SELECT SUBSTRING(CAST(注文日 AS VARCHAR), 0, 5) || SUBSTRING(CAST(注文日 AS VARCHAR), 6, 2),
       COUNT(*) AS 注文回数
  FROM 注文
 GROUP BY SUBSTRING(CAST(注文日 AS VARCHAR), 0, 5) || SUBSTRING(CAST(注文日 AS VARCHAR), 6, 2)
 ORDER BY SUBSTRING(CAST(注文日 AS VARCHAR), 0, 5) || SUBSTRING(CAST(注文日 AS VARCHAR), 6, 2);

--54.
SELECT 商品コード,
       SUM(数量) AS 注文数
  FROM 注文
 WHERE 商品コード LIKE 'Z%'
 GROUP BY 商品コード
HAVING SUM(数量) >= 100;

--55.
SELECT 商品コード,
       商品名,
       単価
       (SELECT SUM(数量)
          FROM 注文 T
         WHERE T.商品コード = S.商品コード) AS 注文数
  FROM 商品 S
 WHERE 商品コード = 'S0604';

 --56.
 UPDATE 注文
    SET 商品コード = (SELECT S.商品コード
                      FROM 商品 S
                     WHERE S.商品区分 = '2'
                       AND S.商品名 LIKE '%ブーツ%'
                       AND S.商品名 LIKE '%雨%'
                       AND S.商品名 LIKE '%安心%')
  WHERE 注文日 = '2013-03-15'
    AND 注文番号 = 201303150014
    AND 注文枝番 = 1;

--57.
SELECT T.注文日,
       T.商品コード
  FROM 注文 T
 WHERE T.商品コード IN (SELECT S.商品コード
                         FROM 商品 S
                        WHERE S.商品名 LIKE '%あったか%')
 ORDER BY 注文日;

 --58.
SELECT 商品コード,
       SUM(数量) AS 販売数
  FROM 注文
 GROUP BY 商品コード
HAVING SUM(数量) >ALL (SELECT AVG(数量)
                        FROM 注文
                       GROUP BY 商品コード);

--59.
SELECT A.合計販売数 AS 割引による販売数,
       (A.割引額合計 / A.合計販売数) AS 平均割引額
  FROM (SELECT SUM(数量) AS 合計販売数,
               SUM(クーポン割引料) AS 割引額合計
          FROM 注文
         WHERE 商品コード = 'W0746'
           AND クーポン割引料 IS NOT NULL) A;

--60.
INSERT INTO 注文
SELECT '2013-03-21' AS 注文日,
       '20130321008' AS 注文番号,
	     (SELECT MAX(注文枝番) + 1
          FROM 注文
         WHERE 注文番号 = '201303210080') AS 注文枝番,
       'S1003' AS 商品コード,
       1 AS 数量,
       NULL AS クーポン割引料;

--61.
SELECT T.注文日 AS 注文日,
       T.注文番号 AS 注文番号,
       T.注文枝番 AS 注文枝番,
       T.商品コード AS 商品コード,
       S.商品名 AS 商品名
  FROM 注文 T INNER JOIN 商品 S
    ON S.商品コード = T.商品コード
 WHERE T.注文番号 = '201301130115';

 --62.
SELECT (H.単価 * T.数量) AS 合計販売額
  FROM 注文 T INNER JOIN 廃盤商品 H
    ON H.商品コード = T.商品コード
 WHERE T.商品コード = 'A0009'
   AND T.注文日 > H.廃番日;

--63.
SELECT (T.数量 * S.単価) AS 売上金額
  FROM 商品 S INNER JOIN 注文 T
    ON T.商品コード = S.商品コード
 WHERE S.商品コード = 'S0604'
  ORDER BY T.注文日;

--64.
SELECT S.商品コード AS 商品コード,
       S.商品名 AS 商品名
  FROM 商品 S
 WHERE EXISTS (SELECT *
                 FROM 注文 T
                WHERE T.商品コード = S.商品コード
                  AND (T.注文日 >= '2011-08-01' AND T.注文日 < '2011-09-01'));

--65.
SELECT T.商品コード AS 商品コード,
       COALESCE(S.商品名, '廃番') AS 商品名
  FROM 注文 T LEFT OUTER JOIN 商品 S
    ON S.商品コード = T.商品コード
 WHERE (T.注文日 >= '2011-08-01' AND T.注文日 < '2011-09-01');

--66.
SELECT T.注文日 AS 注文日,
       S.商品コード || ':' || S.商品名 AS 商品名,
       COALESCE(T.数量, 0) AS 数量
  FROM 商品 S LEFT OUTER JOIN 注文 T
    ON T.商品コード = S.商品コード
 WHERE S.商品区分 = '9';

--67.
SELECT T.注文日 AS 注文日,
       '商品コード' || ':' || COALESCE(S.商品名, '廃番') AS 商品名,
       COALESCE(T.数量, 0) AS 数量
  FROM 注文 T FULL OUTER JOIN 商品 S
    ON S.商品コード = T.商品コード
 WHERE S.商品区分 = '3';

--68.
SELECT T.注文日 AS 注文日,
       T.注文番号 AS 注文番号,
       T.注文枝番 AS 注文枝番,
       (S.商品コード, H.商品コード) AS 商品コード,
       (S.商品名, H.商品名) AS 商品名,
       ((COALESCE(S.単価, H.単価) * T.数量) - COALESCE(T.クーポン割引料, 0)) AS 注文金額
   FROM 注文 T LEFT OUTER JOIN 商品 S
    ON S.商品コード = T.商品コード
 LEFT OUTER JOIN 廃番商品 H
    ON H.商品コード = T.商品コード
 WHERE T.注文番号 = '201204030010';

--69.
SELECT S.商品コード AS 商品コード,
       COALESCE(T.販売数, 0) AS 売上個数,
       (S.単価 * COALESCE(T.販売数, 0)) AS 総売上金額
  FROM 商品 S LEFT OUTER JOIN (SELECT 商品コード,
                                SUM(数量) AS 販売数
                                FROM 注文
                               GROUP BY 商品コード) T
    ON T.商品コード = S.商品コード
 WHERE S.商品コード LIKE 'B%';

--70.
SELECT S.商品名 AS 商品名,
       K.商品名 AS 関連商品名
  FROM 商品 S INNER JOIN 商品 K
    ON K.商品コード = S.関連商品コード
 WHERE S.関連商品コード IS NOT NULL;
