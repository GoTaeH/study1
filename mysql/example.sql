-- 1. 모든 행을 출력 하세요
SELECT * FROM db1.user_info;
-- 2. 여자만 출력 하세요
SELECT *
FROM db1.user_info
WHERE gender = 'Female';
-- 3. 군대는 26살까지 갈 수 있다고 가정할 때, 병사 입대 가능한 인원들을 출력 하세요
SELECT *
FROM db1.user_info
WHERE gender = 'Male' AND age <=26 AND age >= 20;
-- 4. 이메일 TLD가 *.com인 인원들을 이름 내림차순 정렬해서 출력 하세요
SELECT *
FROM db1.user_info
WHERE email LIKE "%.com"
ORDER BY name DESC;
-- 5. id가 100이 넘으면서, 이름에 e가 포함되고, 나이가 40이 넘는 인원들을 출력 하세요
SELECT *
FROM db1.user_info
WHERE id > 100 AND name LIKE "%e%" AND age > 40;
-- 6. 이름을 본인이름을 사용해서 값을 추가 하세요
INSERT INTO user_info (id, name, email, gender, age) values (501, 'Go Taehui', 'ktt@naver.com', 'Female', 21);
-- 7. id를 사용하여 이름이나 개인정보들을 변경 하세요
UPDATE user_info SET  name = 'Irene Antushev', email = 'ireneshevf@paginegialle.it' WHERE id = 16;
-- 8. Male이나 Female이 아닌 인원은 삭제 하세요
DELETE FROM user_info WHERE gender NOT IN ('Male', 'Female');