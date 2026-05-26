package testimpl

import (
	"context"
	"os"
	"testing"
	"strings"

	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	"github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/redisenterprise/armredisenterprise"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestRedisCache(t *testing.T, ctx types.TestContext) {
	subscriptionId := os.Getenv("ARM_SUBSCRIPTION_ID")
	if len(subscriptionId) == 0 {
		t.Fatal("ARM_SUBSCRIPTION_ID environment variable is not set")
	}

	cred, err := azidentity.NewDefaultAzureCredential(nil)
	if err != nil {
		t.Fatalf("Unable to get credentials: %v\n", err)
	}

	t.Run("TestRedisCacheID", func(t *testing.T) {
		checkRedisCacheId(t, ctx, subscriptionId, cred)
	})
}

func checkRedisCacheId(t *testing.T, ctx types.TestContext, subscriptionId string, cred *azidentity.DefaultAzureCredential) {
	client := NewManagedRedisClient(t, subscriptionId, cred)

	resourceGroupName := terraform.Output(t, ctx.TerratestTerraformOptions(), "resource_group_name")
	redisName := terraform.Output(t, ctx.TerratestTerraformOptions(), "redis_name")
	expectedID := terraform.Output(t, ctx.TerratestTerraformOptions(), "redis_id")

	managedRedis, err := client.Get(context.TODO(), resourceGroupName, redisName, nil)
	if err != nil {
		t.Fatalf("failed to get Managed Redis instance: %v", err)
	}

	expectedIDLower := strings.ToLower(expectedID)
	actualIDLower := strings.ToLower(*managedRedis.ID)

	assert.Equal(t, expectedIDLower, actualIDLower, "Managed Redis ID doesn't match")
}

func NewManagedRedisClient(t *testing.T, subscriptionId string, cred *azidentity.DefaultAzureCredential) *armredisenterprise.Client {
	client, err := armredisenterprise.NewClient(subscriptionId, cred, nil)
	if err != nil {
		t.Fatalf("failed to create Managed Redis client: %v", err)
	}
	return client
}
