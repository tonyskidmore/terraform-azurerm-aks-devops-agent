import pytest
import tftest

# tfvars = ["./namespace.tfvars"]

@pytest.fixture(scope="module")
def plan(fixtures_dir):
  tf = tftest.TerraformTest('local', fixtures_dir)
  tf.setup(extra_files=['namespace.tfvars'])
  return tf.plan(output=True)

def test_variables(plan):
  assert 'prefix' in plan.variables
  assert plan.variables['name'] == 'test'
