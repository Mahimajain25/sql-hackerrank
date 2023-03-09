SELECT c.contest_id, c.hacker_id, c.name, 
SUM(ss.ts), SUM(ss.tas), SUM(vs.tv), SUM(vs.tuv) 
FROM Contests c
LEFT JOIN Colleges col ON c.contest_id = col.contest_id 
LEFT JOIN Challenges ch ON col.college_id = ch.college_id 
LEFT JOIN ( SELECT challenge_id, SUM(total_views) as tv, SUM(total_unique_views) as tuv 
FROM View_Stats GROUP BY challenge_id ) vs ON ch.challenge_id = vs.challenge_id 
LEFT JOIN ( SELECT challenge_id, SUM(total_submissions) as ts, SUM(total_accepted_submissions) as tas 
FROM Submission_Stats GROUP BY challenge_id ) ss ON ch.challenge_id = ss.challenge_id 
GROUP BY 1,2,3 
HAVING(SUM(vs.tv) + SUM(vs.tuv) + SUM(ss.ts) + SUM(ss.tas)) > 0 
ORDER BY 1