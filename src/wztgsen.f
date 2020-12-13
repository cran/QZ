      SUBROUTINE WZTGSEN( IJOB, IWANTQ, IWANTZ, ISELECT, N, A, LDA, B,
     $                   LDB,
     $                   ALPHA, BETA, Q, LDQ, Z, LDZ, M, PL, PR, DIF,
     $                   WORK, LWORK, IWORK, LIWORK, INFO )
*     .. Scalar Arguments ..
      INTEGER            IWANTQ, IWANTZ, I
      LOGICAL            WANTQ, WANTZ
      INTEGER            IJOB, INFO, LDA, LDB, LDQ, LDZ, LIWORK, LWORK,
     $                   M, N
      DOUBLE PRECISION   PL, PR
*     ..
*     .. Array Arguments ..
      INTEGER            ISELECT( * )
      LOGICAL            SELECT( N )
      INTEGER            IWORK( * )
      DOUBLE PRECISION   DIF( * )
      COMPLEX*16         A( LDA, * ), ALPHA( * ), B( LDB, * ),
     $                   BETA( * ), Q( LDQ, * ), WORK( * ), Z( LDZ, * )
*
      IF (IWANTQ .EQ. 1) THEN
         WANTQ = .TRUE.
      ELSE
         WANTQ = .FALSE.
      END IF
*
      IF (IWANTZ .EQ. 1) THEN
         WANTZ = .TRUE.
      ELSE
         WANTZ = .FALSE.
      END IF
*
      DO 10 I = 1, N
         IF (ISELECT(I) .EQ. 1) THEN
            SELECT(I) = .TRUE.
         ELSE
            SELECT(I) = .FALSE.
         END IF
   10 CONTINUE
*
      CALL ZTGSEN( IJOB, WANTQ, WANTZ, SELECT, N, A, LDA, B, LDB,
     $                   ALPHA, BETA, Q, LDQ, Z, LDZ, M, PL, PR, DIF,
     $                   WORK, LWORK, IWORK, LIWORK, INFO )
*
      RETURN
*
      END
