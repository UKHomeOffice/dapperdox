package spec

import (
	"github.com/getkin/kin-openapi/openapi3"
	"github.com/go-openapi/loads"
	"github.com/go-openapi/spec"
	"testing"
)

func TestLoadsSwagger2(t *testing.T) {

	const swagger2SpecFile = "../examples/specifications/petstore/swagger.json"

	swagger2Doc, _ := loads.JSONSpec(swagger2SpecFile)

	specification := &APISpecification{}

	_ = spec.ExpandSpec(swagger2Doc.Spec(), nil)

	err := specification.LoadSwagger2(swagger2Doc)

	if err != nil {
		t.Error(`Failed to load spec` + err.Error())
	}

}

func TestLoadsOpenAPI3(t *testing.T) {

	const openAPI3SpecFile = "../examples/specifications/refdata/swagger.yml"

	swagger2Doc, _ := loads.JSONSpec(openAPI3SpecFile)

	specification := &APISpecification{}

	_ = spec.ExpandSpec(swagger2Doc.Spec(), nil)

	openAPI3Spec, _ := openapi3.NewSwaggerLoader().LoadSwaggerFromFile(openAPI3SpecFile)

	err := specification.LoadOpenAPI3(swagger2Doc, openAPI3Spec)

	if err != nil {
		t.Error(`Failed to load spec` + err.Error())
	}

}
