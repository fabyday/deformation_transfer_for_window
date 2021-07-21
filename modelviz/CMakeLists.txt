project(modelviz)

set(header ../common/dt_type.h ../common/matrix3x3.h ../common/mesh_model.h ../common/surface_matrix.h ../common/triangle_corr.h ../common/triangle_corr_dict.h)

set(src main.c modelviz_main.c 
        ../common/cholmod_wrapper.c ../common/constraint.c ../common/matrix3x3.c ../common/mesh_model.c 
        ../common/obj_file.c ../common/surface_matrix.c ../common/triangle_corr.c ../common/triangle_corr_dict.c ../gl_util/gl_util.c)

add_executable(modelviz ${src} ${header})
target_include_directories(modelviz PUBLIC ../gl_util ../common)
# target_include_directories(corres_resolve public ".")
target_link_libraries(modelviz 
SuiteSparse::suitesparseconfig
SuiteSparse::amd
SuiteSparse::btf
SuiteSparse::camd
SuiteSparse::ccolamd
SuiteSparse::colamd
SuiteSparse::cholmod
SuiteSparse::cxsparse
SuiteSparse::klu
SuiteSparse::ldl
SuiteSparse::umfpack
SuiteSparse::spqr
# SuiteSparse::metis common
${lapackblas_libraries} freeglut_static)


add_custom_command(TARGET modelviz POST_BUILD
COMMAND ${CMAKE_COMMAND} -E copy_directory
    "${CMAKE_SOURCE_DIR}/ext/suitesparse-metis-for-windows/lapack_windows/x64"
    $<TARGET_FILE_DIR:modelviz>)
add_custom_command(TARGET modelviz POST_BUILD
COMMAND ${CMAKE_COMMAND} -E copy_directory
$<TARGET_FILE_DIR:modelviz>
    "${CMAKE_SOURCE_DIR}/bin2")