SELECT
    p.purchase_date AS purchase_date,
    p.purchase_id AS purchase_id,
    cl.client_id AS client_id,
    toInt64(dateDiff('year', cl.birth_date, today())) AS client_age,
    toInt64(dateDiff('year',  cl.registration, today())) AS client_registration_age,
    pr.partner_name AS partner_name,
    pr.promotion_name AS promotion_name,
    cat.client_category AS client_category,
    pr.category_name AS category_name,
    c.client_city AS client_city,
    c.city AS city,
    toInt64(p.quantity) AS quantity,
    toInt64(p.quantity * p.price) AS revenue
FROM project_variant_2.purchase AS p
JOIN
    project_variant_2.client AS cl
ON p.client_id = cl.client_id
JOIN
    project_variant_2.city AS c
ON p.city_id = c.city_id AND cl.client_city_id = c.client_city_id
JOIN
    project_variant_2.promotion AS pr
ON p.promotion_id = pr.promotion_id
JOIN
    (SELECT
        client_category,
        client_id
    FROM
        (SELECT
            client_id,
            COUNT(purchase_id) as count_purchase,
            CASE
            WHEN count_purchase = 1
                THEN 'new'
                ELSE 'old'
            END AS client_category
        FROM
            project_variant_2.purchase
        WHERE status = 1
        GROUP BY client_id
        )

    ) as cat

    ON p.client_id = cat.client_id

WHERE status = 1
AND purchase_date BETWEEN '2020-05-01' AND '2020-08-01'
