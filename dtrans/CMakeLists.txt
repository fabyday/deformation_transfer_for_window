project(corres_resolve)
set(header dt_equation.h mesh_seg.h transformer.h 
    ../common/dt_type.h ../common/matrix3x3.h ../common/mesh_model.h 
    ../common/surface_matrix.h ../common/triangle_corr.h 
    ../common/triangle_corr_dict.h)
set(src dt_equation.c main.c mesh_seg.c transformer.c 
        ../common/cholmod_wrapper.c ../common/constraint.c 
        ../common/matrix3x3.c ../common/mesh_model.c 
        ../common/obj_file.c ../common/surface_matrix.c 
        ../common/triangle_corr.c ../common/triangle_corr_dict.c )




add_executable(dtrans ${src} ${header})
target_include_directories(dtrans PUBLIC ../gl_util ../common)
target_link_libraries(dtrans 
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
# SuiteSparse::metis

${lapackblas_libraries} )



add_custom_command(TARGET dtrans POST_BUILD
COMMAND ${CMAKE_COMMAND} -E copy_directory
"${CMAKE_SOURCE_DIR}/ext/suitesparse-metis-for-windows/lapack_windows/x64"
$<TARGET_FILE_DIR:dtrans>)



add_custom_command(TARGET dtrans POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
$<TARGET_FILE_DIR:dtrans>
    "${CMAKE_SOURCE_DIR}/bin2")