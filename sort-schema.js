#!/usr/bin/env node
const { parse, buildASTSchema } = require("graphql");
const { printSchema } = require("graphql/utilities");
const fs = require('fs');

const printSchemaOrdered = schemaText => {
  // Clone schema so we don't damage anything
  const schema = buildASTSchema(parse(schemaText));

  const typeMap = schema.getTypeMap();
  Object.keys(typeMap).forEach(name => {
    const Type = typeMap[name];

    // Object?
    if (Type.getFields) {
      const fields = Type.getFields();
      const keys = Object.keys(fields).sort();
      keys.forEach(key => {
        const value = fields[key];

        // Move the key to the end of the object
        delete fields[key];
        fields[key] = value;

        // Sort args
        if (value.args) {
          value.args.sort((a, b) => a.name.localeCompare(b.name));
        }
      });
    }

    // Enum?
    if (Type.getValues) {
      Type.getValues().sort((a, b) => a.name.localeCompare(b.name));
    }
  });

  return printSchema(schema);
};


const sorted = printSchemaOrdered(fs.readFileSync(process.argv[2], 'utf8'));
console.log(sorted);
