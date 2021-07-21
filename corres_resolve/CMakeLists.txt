project(corres_resolve)

set(header 3dtree.h adjacent.h closest_point.h corres_problem.h correseqn.h vertex_info.h 
            ../common/dt_type.h ../common/matrix3x3.h ../common/mesh_model.h ../common/surface_matrix.h 
            ../common/triangle_corr.h ../common/triangle_corr_dict.h)

set(src 3dtree.c 3dtree_search.c 3dtree_split.c adjacent.c adjacent_resolve.c closest_point.c 
        corres_problem.c corres_problem_solve.c correseqn.c correseqn_closest.c correseqn_elementary.c correseqn_smoothness.c correseqn_identity.c
        main.c triangle_corr_resolve.c vertex_info.c
        ../common/cholmod_wrapper.c ../common/constraint.c ../common/matrix3x3.c ../common/mesh_model.c 
        ../common/obj_file.c ../common/surface_matrix.c ../common/triangle_corr.c ../common/triangle_corr_dict.c
        ../gl_util/gl_util.c
)

add_executable(corres_resolve ${src} ${header})
target_include_directories(corres_resolve PUBLIC ../gl_util ../common)
# target_include_directories(corres_resolve public ".")
target_link_libraries(corres_resolve 
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
${lapackblas_libraries} freeglut_static)



add_custom_command(TARGET corres_resolve POST_BUILD
COMMAND ${CMAKE_COMMAND} -E copy_directory
    "${CMAKE_SOURCE_DIR}/ext/suitesparse-metis-for-windows/lapack_windows/x64"
    $<TARGET_FILE_DIR:corres_resolve>)


add_custom_command(TARGET corres_resolve POST_BUILD
COMMAND ${CMAKE_COMMAND} -E copy_directory
$<TARGET_FILE_DIR:corres_resolve>
    "${CMAKE_SOURCE_DIR}/bin2")