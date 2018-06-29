--Class 6.28

SELECT userid, referred_by
FROM da_readychef.users u 
LEFT JOIN da_readychef.referrals r ON u.userid = r.referred