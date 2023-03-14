schema "public" {}

table "rate" {
  schema = schema.public
  column "id" {
    type = int
    null = false
  }

  column "name" {
    type = text
  }

  primary_key {
    columns = [column.id]
  }
}

table "contract" {
  schema = schema.public
  column "id" {
    type = int
  }

  column "name" {
    type = text
  }

  primary_key {
    columns = [column.id]
  }
}

table "contract_to_rate" {
  schema = schema.public
  column "id" {
    type = int
  }

  column "rate_id" {
    type = int
    null = false
  }

  column "contract_id" {
    type = int
    null = false
  }

  column "valid_as_of" {
    null = false
    type = timestamp
    default = sql("now()")
  }

  foreign_key "rate_fk" {
    columns     = [column.rate_id]
    ref_columns = [table.rate.column.id]
    on_delete = CASCADE
  }

  foreign_key "contract_fk" {
    columns     = [column.contract_id]
    ref_columns = [table.contract.column.id]
    on_delete = CASCADE
  }
}
