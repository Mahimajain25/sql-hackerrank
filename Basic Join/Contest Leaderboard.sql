SELECT h.hacker_id, h.name, SUM(sub.score)
FROM
    (SELECT hacker_id, challenge_id, MAX(score) score
    FROM submissions
    GROUP BY hacker_id, challenge_id) sub
JOIN hackers h
ON sub.hacker_id = h.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(sub.score) != 0
ORDER BY SUM(sub.score) DESC, h.hacker_id