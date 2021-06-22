select ASSIGNMENTs.id,ASSIGNMENTs.name,ASSIGNMENTs.day,ASSIGNMENTs.chapter,Count(assistance_requests.id) as total_requests
FROM assistance_requests
JOIN assignments ON assistance_requests.assignment_id = assignments.id
group by ASSIGNMENTs.id
ORDER BY total_requests DESC;