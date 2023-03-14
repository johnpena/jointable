WITH ranked_rates AS (
	SELECT
		rate.id AS rate_id,
		RANK() OVER (ORDER BY valid_as_of DESC) AS rate_rank
	FROM
		rate
		JOIN contract_to_rate ctr ON rate.id = ctr.rate_id
	WHERE
		ctr.contract_id = 1
)
SELECT
	*
FROM
	ranked_rates
WHERE
	rate_rank = 1