-- DROP TABLE account;
DROP TABLE transactions;
DROP TABLE types;
DROP TABLE companies;

CREATE TABLE types(
  id SERIAL4 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE companies(
  id SERIAL4 PRIMARY KEY,
  company VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  debit_credit VARCHAR(255),
  type_id INT4 references types(id) ON DELETE CASCADE,
  company_id INT4 references companies(id)ON DELETE CASCADE,
  amount DECIMAL(8, 2),
  dot DATE
  );