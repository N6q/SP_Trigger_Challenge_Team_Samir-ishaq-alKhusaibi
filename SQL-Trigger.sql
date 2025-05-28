CREATE TABLE production.product_audits(
    change_id INT IDENTITY PRIMARY KEY,
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DEC(10,2) NOT NULL,
    updated_at DATETIME NOT NULL,
    operation CHAR(3) NOT NULL,
    CHECK(operation = 'INS' or operation='DEL')
);

create or alter trigger keep_changes 
on production.products
after insert , delete 
as
begin
INSERT INTO
    production.product_audits
        (
            product_id,
            product_name,
            brand_id,
            category_id,
            model_year,
            list_price,
            updated_at,
            operation
        )
SELECT
    i.product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    i.list_price,
    GETDATE(),
    'INS'
FROM
    inserted AS i
UNION ALL
    SELECT
        d.product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        d.list_price,
        getdate(),
        'DEL'
    FROM
        deleted AS d;
end







	SELECT * FROM production.categories;

	INSERT INTO production.categories (category_name)
VALUES ('Example Category');

INSERT INTO production.brands (brand_name)
VALUES ('Example Brand');  -- This will usually create brand_id = 1
INSERT INTO production.brands (brand_name)
VALUES ('Brand A'), ('Brand B');  -- Now you'll have brand_id = 1 and 2
INSERT INTO production.categories (category_name)
VALUES ('Category A'), ('Category B');

INSERT INTO production.products (
    product_name, 
    brand_id, 
    category_id, 
    model_year, 
    list_price
)
VALUES (
    'test_product',
    2,   -- must exist in brands
    1,   -- must exist in categories
    2018,
    599
);

SELECT 
    * 
FROM 
    production.product_audits;

	DELETE FROM 
    production.products
WHERE 
    product_id = 6;

	SELECT 
    * 
FROM 
    production.product_audits;