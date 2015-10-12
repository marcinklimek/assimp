CC=gcc
CPP=g++
MACROS=-DASSIMP_BUILD_BOOST_WORKAROUND\
			 -DASSIMP_BUILD_DLL_EXPORT\
			 -DASSIMP_BUILD_NO_C4D_IMPORTER\
			 -DASSIMP_BUILD_NO_IFC_IMPORTER\
			 -DASSIMP_BUILD_NO_STEP_EXPORTER\
			 -DASSIMP_BUILD_NO_OWN_ZLIB\
			 -DOPENDDLPARSER_BUILD\
			 -DOPENDDL_NO_USE_CPP11\
			 -Dassimp_EXPORTS
CFLAGS=-c -Wall -fPIC -Iproject -Iinclude -Icode/BoostWorkaround -Icontrib/openddlparser/include -Icontrib/unzip $(MACROS) -fvisibility=hidden
OBJDIR=build
OBJECTS=code/Assimp.o code/BaseImporter.o code/BaseProcess.o code/PostStepRegistry.o code/ImporterRegistry.o code/DefaultIOStream.o code/DefaultIOSystem.o code/Importer.o code/SGSpatialSort.o code/VertexTriangleAdjacency.o code/SpatialSort.o code/SceneCombiner.o code/ScenePreprocessor.o code/SkeletonMeshBuilder.o code/SplitByBoneCountProcess.o code/StandardShapes.o code/TargetAnimation.o code/RemoveComments.o code/Subdivision.o code/Bitmap.o code/Version.o code/DefaultLogger.o code/Exporter.o code/AssimpCExport.o code/CalcTangentsProcess.o code/ComputeUVMappingProcess.o code/ConvertToLHProcess.o code/FindDegenerates.o code/FindInstancesProcess.o code/FindInvalidDataProcess.o code/FixNormalsStep.o code/GenFaceNormalsProcess.o code/GenVertexNormalsProcess.o code/PretransformVertices.o code/ImproveCacheLocality.o code/JoinVerticesProcess.o code/LimitBoneWeightsProcess.o code/RemoveRedundantMaterials.o code/RemoveVCProcess.o code/SortByPTypeProcess.o code/SplitLargeMeshes.o code/TextureTransform.o code/TriangulateProcess.o code/ValidateDataStructure.o code/OptimizeGraph.o code/OptimizeMeshes.o code/DeboneProcess.o code/ProcessHelper.o code/MakeVerboseFormat.o code/MaterialSystem.o code/3DSConverter.o code/3DSLoader.o code/3DSExporter.o code/ACLoader.o code/ASELoader.o code/ASEParser.o code/AssbinExporter.o code/AssbinLoader.o code/AssxmlExporter.o code/B3DImporter.o code/BVHLoader.o code/ColladaLoader.o code/ColladaParser.o code/ColladaExporter.o code/DXFLoader.o code/CSMLoader.o code/HMPLoader.o code/IRRLoader.o code/IRRMeshLoader.o code/IRRShared.o code/LWOAnimation.o code/LWOBLoader.o code/LWOLoader.o code/LWOMaterial.o code/LWSLoader.o code/MD2Loader.o code/MD3Loader.o code/MD5Loader.o code/MD5Parser.o code/MDCLoader.o code/MDLLoader.o code/MDLMaterialLoader.o code/NFFLoader.o code/NDOLoader.o code/OFFLoader.o code/ObjFileImporter.o code/ObjFileMtlImporter.o code/ObjFileParser.o code/ObjExporter.o code/OgreImporter.o code/OgreStructs.o code/OgreBinarySerializer.o code/OgreXmlSerializer.o code/OgreMaterial.o code/OpenGEXExporter.o code/OpenGEXImporter.o code/PlyLoader.o code/PlyParser.o code/PlyExporter.o code/MS3DLoader.o code/COBLoader.o code/BlenderLoader.o code/BlenderDNA.o code/BlenderScene.o code/BlenderModifier.o code/BlenderBMesh.o code/BlenderTessellator.o code/XGLLoader.o code/FBXImporter.o code/FBXParser.o code/FBXTokenizer.o code/FBXConverter.o code/FBXUtil.o code/FBXDocument.o code/FBXProperties.o code/FBXMeshGeometry.o code/FBXMaterial.o code/FBXModel.o code/FBXAnimation.o code/FBXNodeAttribute.o code/FBXDeformer.o code/FBXBinaryTokenizer.o code/FBXDocumentUtil.o code/Q3DLoader.o code/Q3BSPFileParser.o code/Q3BSPFileImporter.o code/Q3BSPZipArchive.o code/RawLoader.o code/SMDLoader.o code/STLLoader.o code/STLExporter.o code/TerragenLoader.o code/UnrealLoader.o code/XFileImporter.o code/XFileParser.o code/XFileExporter.o contrib/irrXML/irrXML.o contrib/openddlparser/code/OpenDDLParser.o contrib/openddlparser/code/DDLNode.o contrib/openddlparser/code/Value.o contrib/zlib/adler32.o contrib/zlib/compress.o contrib/zlib/crc32.o contrib/zlib/deflate.o contrib/zlib/gzclose.o contrib/zlib/gzlib.o contrib/zlib/gzread.o contrib/zlib/gzwrite.o contrib/zlib/infback.o contrib/zlib/inffast.o contrib/zlib/inflate.o contrib/zlib/inftrees.o contrib/zlib/trees.o contrib/zlib/uncompr.o contrib/zlib/zutil.o contrib/ConvertUTF/ConvertUTF.o contrib/unzip/ioapi.o contrib/unzip/unzip.o contrib/poly2tri/poly2tri/common/shapes.o contrib/poly2tri/poly2tri/sweep/advancing_front.o contrib/poly2tri/poly2tri/sweep/cdt.o contrib/poly2tri/poly2tri/sweep/sweep.o contrib/poly2tri/poly2tri/sweep/sweep_context.o 

OBJDIR_OBJECTS=$(addprefix $(OBJDIR)/, $(OBJECTS))

.PHONY: all
all: Release/assimp.a

$(OBJDIR)/%.o: %.cpp
	@mkdir -p $$(dirname $@)
	$(CPP) $(CFLAGS) -c -o $@ $<

$(OBJDIR)/%.o: %.cc
	@mkdir -p $$(dirname $@)
	$(CPP) $(CFLAGS) -c -o $@ $<

$(OBJDIR)/%.o: %.c
	@mkdir -p $$(dirname $@)
	$(CC) $(CFLAGS) -c -o $@ $<

Release/assimp.a: $(OBJDIR_OBJECTS) $(OBJDIR_DATA)
	ar rcs Release/assimp.a $(OBJDIR_OBJECTS)

.PHONY: clean
clean:
	rm -rf Release $(OBJDIR)
