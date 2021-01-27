# https://github.com/hashicorp/terraform/issues/27596

## Pre-requisites

In order to run the docker-compose you will need to register for the PingIdentity DevOps program to get the USER/KEY environment variables.
https://devops.pingidentity.com/get-started/devopsRegistration/

## Steps to reproduce

1. `docker-compose up -d`
2. `terraform init`
3. `terraform apply --auto-approve`

```
 terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # pingfederate_notification_publisher.mailserver will be created
  + resource "pingfederate_notification_publisher" "mailserver" {
      + id           = (known after apply)
      + name         = "demo"
      + publisher_id = "demo"

      + configuration {
          + fields {
              + inherited = false
              + name      = "Connection Timeout"
              + value     = "30"
            }
          + fields {
              + inherited = false
              + name      = "Email Server"
              + value     = "email-smtp.eu-west-1.amazonaws.com"
            }
          + fields {
              + inherited = false
              + name      = "Enable SMTP Debugging Messages"
              + value     = "false"
            }
          + fields {
              + inherited = false
              + name      = "Encryption Method"
              + value     = "SSL"
            }
          + fields {
              + inherited = false
              + name      = "From Address"
              + value     = "someone@test.com"
            }
          + fields {
              + inherited = false
              + name      = "Retry Attempt"
              + value     = "2"
            }
          + fields {
              + inherited = false
              + name      = "Retry Delay"
              + value     = "2"
            }
          + fields {
              + inherited = false
              + name      = "SMTP Port"
              + value     = "25"
            }
          + fields {
              + inherited = false
              + name      = "SMTPS Port"
              + value     = "465"
            }
          + fields {
              + inherited = false
              + name      = "Test Address"
              + value     = "example@test.com"
            }
          + fields {
              + inherited = false
              + name      = "Username"
              + value     = "someone"
            }
          + fields {
              + inherited = false
              + name      = "Verify Hostname"
              + value     = "false"
            }

          + sensitive_fields {
              # At least one attribute in this block is (or was) sensitive,
              # so its contents will not be displayed.
            }
        }

      + plugin_descriptor_ref {
          + id       = "com.pingidentity.email.SmtpNotificationPlugin"
          + location = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

pingfederate_notification_publisher.mailserver: Creating...
panic: value is marked, so must be unmarked first

goroutine 169 [running]:
github.com/zclconf/go-cty/cty.Value.assertUnmarked(...)
        github.com/zclconf/go-cty@v1.7.1/cty/marks.go:123
github.com/zclconf/go-cty/cty.Value.ElementIterator(0x386a920, 0xc000914ae0, 0x315e280, 0xc0006d9f60, 0x0, 0x10)
        github.com/zclconf/go-cty@v1.7.1/cty/value_ops.go:1111 +0x4f
github.com/hashicorp/terraform/plans/objchange.couldHaveUnknownBlockPlaceholder(0x386a920, 0xc000914ae0, 0x315e280, 0xc0006d9f60, 0xc000a89950, 0x1, 0x386a920)
        github.com/hashicorp/terraform/plans/objchange/compatible.go:361 +0x188
github.com/hashicorp/terraform/plans/objchange.couldBeUnknownBlockPlaceholderElement(0x386a8e0, 0xc000914b00, 0x3068d40, 0xc000f097a0, 0xc000a898b0, 0x386a8e0)
        github.com/hashicorp/terraform/plans/objchange/compatible.go:410 +0x3ce
github.com/hashicorp/terraform/plans/objchange.couldHaveUnknownBlockPlaceholder(0x386a860, 0xc000914b20, 0x2f3d6c0, 0xc0006d9f80, 0xc000a898b0, 0xc001020900, 0x2f3d6c0)
        github.com/hashicorp/terraform/plans/objchange/compatible.go:363 +0x206
github.com/hashicorp/terraform/plans/objchange.assertObjectCompatible(0xc0008b6c90, 0x386a8e0, 0xc000914b70, 0x3068d40, 0xc000f09800, 0x386a8e0, 0xc0010209b0, 0x3068d40, 0xc001022c90, 0x0, ...)
        github.com/hashicorp/terraform/plans/objchange/compatible.go:84 +0xec9
github.com/hashicorp/terraform/plans/objchange.AssertObjectCompatible(...)
        github.com/hashicorp/terraform/plans/objchange/compatible.go:26
github.com/hashicorp/terraform/terraform.(*EvalApply).Eval(0xc000e11968, 0x38a61e0, 0xc000c8ac30, 0x0, 0x0, 0x0, 0x0)
        github.com/hashicorp/terraform/terraform/eval_apply.go:260 +0x11cf
github.com/hashicorp/terraform/terraform.(*NodeApplyableResourceInstance).managedResourceExecute(0xc000edc480, 0x38a61e0, 0xc000c8ac30, 0x8f, 0x800)
        github.com/hashicorp/terraform/terraform/node_resource_apply_instance.go:350 +0xb65
github.com/hashicorp/terraform/terraform.(*NodeApplyableResourceInstance).Execute(0xc000edc480, 0x38a61e0, 0xc000c8ac30, 0x4951f01, 0x0, 0x0)
        github.com/hashicorp/terraform/terraform/node_resource_apply_instance.go:128 +0xdc
github.com/hashicorp/terraform/terraform.(*ContextGraphWalker).Execute(0xc000c8a000, 0x38a61e0, 0xc000c8ac30, 0x2d2c8408, 0xc000edc480, 0x0, 0x0, 0x0)
        github.com/hashicorp/terraform/terraform/graph_walk_context.go:127 +0xbc
github.com/hashicorp/terraform/terraform.(*Graph).walk.func1(0x33d5820, 0xc000edc480, 0x0, 0x0, 0x0)
        github.com/hashicorp/terraform/terraform/graph.go:59 +0x962
github.com/hashicorp/terraform/dag.(*Walker).walkVertex(0xc000536480, 0x33d5820, 0xc000edc480, 0xc000d28340)
        github.com/hashicorp/terraform/dag/walk.go:387 +0x375
created by github.com/hashicorp/terraform/dag.(*Walker).Update
        github.com/hashicorp/terraform/dag/walk.go:309 +0x1246



!!!!!!!!!!!!!!!!!!!!!!!!!!! TERRAFORM CRASH !!!!!!!!!!!!!!!!!!!!!!!!!!!!

Terraform crashed! This is always indicative of a bug within Terraform.
A crash log has been placed at "crash.log" relative to your current
working directory. It would be immensely helpful if you could please
report the crash with Terraform[1] so that we can fix this.

When reporting bugs, please include your terraform version. That
information is available on the first line of crash.log. You can also
get it by running 'terraform --version' on the command line.

SECURITY WARNING: the "crash.log" file that was created may contain 
sensitive information that must be redacted before it is safe to share 
on the issue tracker.

[1]: https://github.com/hashicorp/terraform/issues

!!!!!!!!!!!!!!!!!!!!!!!!!!! TERRAFORM CRASH !!!!!!!!!!!!!!!!!!!!!!!!!!!!

```