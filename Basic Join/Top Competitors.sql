SELECT H.hacker_id,H.name 
FROM HACKERS H
JOIN SUBMISSIONS S ON H.hacker_id = S.hacker_id
JOIN CHALLENGES C ON C.challenge_id = S.challenge_id
JOIN DIFFICULTY D ON D.score = S.score AND D.difficulty_level = C.difficulty_level
GROUP BY H.hacker_id,H.name
HAVING COUNT(C.challenge_id ) > 1
ORDER BY COUNT(C.challenge_id) DESC, H.hacker_id ASC 