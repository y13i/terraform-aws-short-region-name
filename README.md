# terraform-aws-short-region-name

Converts AWS region names to short codes.

## How It Works

Uses AWS availability zone IDs to derive short region codes:

1. Queries availability zones for the specified region
2. Gets the first zone ID (e.g., `use1-az1` for `us-east-1`)
3. Strips the `-az\d+` suffix to get the short code (`use1`)

## Examples

| Region           | Short Code |
| ---------------- | ---------- |
| `us-east-1`      | `use1`     |
| `us-west-2`      | `usw2`     |
| `ap-northeast-1` | `apne1`    |
| `eu-west-1`      | `euw1`     |

## Usage

```hcl
module "short_region" {
  source = "github.com/y13i/terraform-aws-short-region-name"
  region = "us-east-1"
}

output "short_region_code" {
  value = module.short_region.name  # "use1"
}
```

## Inputs

| Name   | Type   | Description                                                  | Required |
| ------ | ------ | ------------------------------------------------------------ | -------- |
| region | string | AWS region name (e.g., us-east-1, us-west-2, ap-northeast-1) | yes      |

## Outputs

| Name | Description                                   |
| ---- | --------------------------------------------- |
| name | Short region code derived from the AWS region |

## License

MIT
