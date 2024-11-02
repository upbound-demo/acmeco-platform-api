import models.v1beta1 as v1beta1

oxr = option("params").oxr # observed composite resource
_ocds = option("params").ocds # observed composed resources
_dxr = option("params").dxr # desired composite resource
dcds = option("params").dcds # desired composed resources

_metadata = lambda name: str -> any {
    { annotations = { "krm.kcl.dev/composition-resource-name" = name }}
}

_items = [v1beta1.Bucket {

    metadata = _metadata("bucket")
    spec.forProvider = {
        region: oxr.spec.parameters.location
    }
}]
items = _items
