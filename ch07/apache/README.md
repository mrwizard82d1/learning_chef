# apache cookbook

This cookbook installs and configures a simple web site using the Apached HTTPD server.

## Requirements

Supports only CentOS or other RHEL variants that use the `httpd` package.

## Usage

Add `apache` to your node's `run_list`.

## Testing

A `.kitchen.yml` file is provided. Run `kitchen converge` to verify this command. 
