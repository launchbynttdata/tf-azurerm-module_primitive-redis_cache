package main

import (
	"fmt"
	"strings"
)

func main() {
	expectedID := "/subscriptions/4554e249-e00f-4668-9be3-da31ed200163/resourceGroups/launch-redis-1798679852/providers/Microsoft.Cache/redis/launch-redis-5318838457"
	actualID := "/subscriptions/4554e249-e00f-4668-9be3-da31ed200163/resourceGroups/launch-redis-1798679852/providers/Microsoft.Cache/Redis/launch-redis-5318838457"

	// Normalize the case of both IDs
	expectedIDLower := strings.ToLower(expectedID)
	actualIDLower := strings.ToLower(actualID)

	// Perform the assertion
	if expectedIDLower == actualIDLower {
		fmt.Println("Redis Cache ID is valid.")
	} else {
		fmt.Printf("Redis Cache ID is invalid. Expected: %s, Got: %s\n", expectedIDLower, actualIDLower)
	}
}
