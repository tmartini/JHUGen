      subroutine qqbttz(denu,denb,denz1,denz2,propz,wtqqb,wtqbq)
      implicit none
C***********************************************************************
C     Author: R.K. Ellis                                               *
C     December, 2010.                                                  *
C     calculate the Born matrix element squared                        *
C     for the process                                                  *
c     My notation                                                      *
C     qb(-p1) + q(-p2)=bbar(p6)+e-(p7)+nubar(p8)+b(p5)+nu(p3)+e+(p4)   *
C     +e^-(p9)+e^+(p10)                                                *
C                                                                      *
C z=9+10                                                               *
C q=3+4+5                                                              *
C r=3+4+5+z                                                            *
C a=-6-7-8                                                             *
C b=-6-7-8-z                                                           *
C since momenta 3,5,6,8 are not needed they are reused to              *
C represent the de-massified vectors.                                  *
C Thus q4 = q de-massified wrt p4 etc;                                 *
C this vector has been stored in wrapper routine (qqb_ttz) in p(3,mu)  *
C q4(mu)=q(mu)-qsq/2/p4Dq*p4(mu)-->p(3,mu)                             *
C a7(mu)=a(mu)-asq/2/p7Da*p7(mu)-->p(5,mu)                             *
C u1(mu)=u(mu)-usq/2/p1Du*p1(mu)-->p(6,mu)                             *
C u2(mu)=u(mu)-usq/2/p2Du*p2(mu)-->p(8,mu)                             *
C b1(mu)=b(mu)-bsq/2/p1Db*p1(mu)-->p(11,mu)                            *
C b2(mu)=b(mu)-bsq/2/p2Db*p2(mu)-->p(12,mu)                            *
C Formula generated by the program qqbttz.frm                          *
C First index of m is the lepton polarization, second is the qqb       *
************************************************************************
      include 'constants.f'
      include 'zcouple.f'
      include 'ewcharge.f'
      include 'zprods_com.f'
      include 'sprods_com.f'
      include 'masses.f'
      include 'topzlabels.f'
      double complex mqqb(2,2),mqbq(2,2),propz
      double precision denu,denb,denz1,denz2,wtqqb(2),wtqbq(2),s12,s12z
      integer h1,h2,j,j12
      s12=s(p1,p2)
      s12z=s(p1,p2)+s(p1,p9)+s(p1,p10)+s(p2,p9)+s(p2,p10)+s(p9,p10)
C For charge and couplings of top quark, use up-charge
      j=2
      do j12=1,2
      wtqbq(j12)=0d0
      wtqqb(j12)=0d0
      mqbq(1,1)= + (Q(j)*q1+propz*L(j)*l1)*s12**(-1)*denu**(-1) * (  -
     &    za(p1,p7)*za(p9,q4)*zb(p2,p10)*zb(p4,q4)*mt**2 + za(p1,u1)*
     &    za(p7,a7)*za(p9,q4)*zb(p2,a7)*zb(p4,q4)*zb(p10,u1) )
      mqbq(1,1) = mqbq(1,1) + (Q(j)*q1+propz*L(j)*l1)*s12**(-1)*
     & denb**(-1) * (  - za(p1,p9)*za(p7,a7)*zb(p2,p4)*zb(p10,a7)*mt**2
     &     + za(p1,q4)*za(p7,a7)*za(p9,b2)*zb(p2,b2)*zb(p4,q4)*zb(p10,
     &    a7) )
      mqbq(1,1) = mqbq(1,1) + (Q(j)*q1+propz*R(j)*l1)*s12**(-1)*
     & denu**(-1) * ( za(p1,p7)*za(p9,u2)*zb(p2,u2)*zb(p4,p10)*mt**2 -
     &    za(p1,p9)*za(p7,a7)*zb(p2,a7)*zb(p4,p10)*mt**2 )
      mqbq(1,1) = mqbq(1,1) + (Q(j)*q1+propz*R(j)*l1)*s12**(-1)*
     & denb**(-1) * (  - za(p1,q4)*za(p7,p9)*zb(p2,p10)*zb(p4,q4)*mt**2
     &     + za(p1,b1)*za(p7,p9)*zb(p2,p4)*zb(p10,b1)*mt**2 )

      mqbq(1,1)=mqbq(1,1) + (Q(j12)*q1+propz*L(j12)*l1)*s12z**(-1)*
     & denz1**(-1) * (  - za(p1,p7)*za(p1,p9)*zb(p1,p10)*zb(p2,p4)*
     &    mt**2 + za(p1,p9)*za(p1,q4)*za(p7,a7)*zb(p1,p10)*zb(p2,a7)*
     &    zb(p4,q4) + za(p1,p9)*za(p7,p9)*zb(p2,p4)*zb(p9,p10)*mt**2 +
     &    za(p1,p9)*za(p7,a7)*za(p9,q4)*zb(p2,a7)*zb(p4,q4)*zb(p9,p10)
     &     )
      mqbq(1,1) = mqbq(1,1) + (Q(j12)*q1+propz*L(j12)*l1)*s12z**(-1)*
     & denz2**(-1) * ( za(p1,p7)*za(p2,p9)*zb(p2,p4)*zb(p2,p10)*mt**2
     &     + za(p1,p7)*za(p9,p10)*zb(p2,p10)*zb(p4,p10)*mt**2 - za(p1,
     &    q4)*za(p2,p9)*za(p7,a7)*zb(p2,p10)*zb(p2,a7)*zb(p4,q4) + za(
     &    p1,q4)*za(p7,a7)*za(p9,p10)*zb(p2,p10)*zb(p4,q4)*zb(p10,a7) )

      mqbq(2,1)= + (Q(j)*q1+propz*R(j)*r1)*s12**(-1)*denu**(-1) * ( za(
     &    p1,p7)*za(p10,u2)*zb(p2,u2)*zb(p4,p9)*mt**2 - za(p1,p10)*za(
     &    p7,a7)*zb(p2,a7)*zb(p4,p9)*mt**2 )
      mqbq(2,1) = mqbq(2,1) + (Q(j)*q1+propz*R(j)*r1)*s12**(-1)*
     & denb**(-1) * (  - za(p1,q4)*za(p7,p10)*zb(p2,p9)*zb(p4,q4)*mt**2
     &     + za(p1,b1)*za(p7,p10)*zb(p2,p4)*zb(p9,b1)*mt**2 )
      mqbq(2,1) = mqbq(2,1) + (Q(j)*q1+propz*L(j)*r1)*s12**(-1)*
     & denu**(-1) * (  - za(p1,p7)*za(p10,q4)*zb(p2,p9)*zb(p4,q4)*mt**2
     &     + za(p1,u1)*za(p7,a7)*za(p10,q4)*zb(p2,a7)*zb(p4,q4)*zb(p9,
     &    u1) )
      mqbq(2,1) = mqbq(2,1) + (Q(j)*q1+propz*L(j)*r1)*s12**(-1)*
     & denb**(-1) * (  - za(p1,p10)*za(p7,a7)*zb(p2,p4)*zb(p9,a7)*mt**2
     &     + za(p1,q4)*za(p7,a7)*za(p10,b2)*zb(p2,b2)*zb(p4,q4)*zb(p9,
     &    a7) )

      mqbq(2,1)=mqbq(2,1) + (Q(j12)*q1+propz*L(j12)*r1)*s12z**(-1)*
     & denz1**(-1) * (  - za(p1,p7)*za(p1,p10)*zb(p1,p9)*zb(p2,p4)*
     &    mt**2 + za(p1,p10)*za(p1,q4)*za(p7,a7)*zb(p1,p9)*zb(p2,a7)*
     &    zb(p4,q4) - za(p1,p10)*za(p7,p10)*zb(p2,p4)*zb(p9,p10)*mt**2
     &     - za(p1,p10)*za(p7,a7)*za(p10,q4)*zb(p2,a7)*zb(p4,q4)*zb(p9,
     &    p10) )
      mqbq(2,1) = mqbq(2,1) + (Q(j12)*q1+propz*L(j12)*r1)*s12z**(-1)*
     & denz2**(-1) * ( za(p1,p7)*za(p2,p10)*zb(p2,p4)*zb(p2,p9)*mt**2
     &     - za(p1,p7)*za(p9,p10)*zb(p2,p9)*zb(p4,p9)*mt**2 - za(p1,q4)
     &    *za(p2,p10)*za(p7,a7)*zb(p2,p9)*zb(p2,a7)*zb(p4,q4) - za(p1,
     &    q4)*za(p7,a7)*za(p9,p10)*zb(p2,p9)*zb(p4,q4)*zb(p9,a7) )

      mqbq(1,2)= + (Q(j)*q1+propz*L(j)*l1)*s12**(-1)*denu**(-1) * (  -
     &    za(p2,p7)*za(p9,q4)*zb(p1,p10)*zb(p4,q4)*mt**2 + za(p2,u2)*
     &    za(p7,a7)*za(p9,q4)*zb(p1,a7)*zb(p4,q4)*zb(p10,u2) )
      mqbq(1,2) = mqbq(1,2) + (Q(j)*q1+propz*L(j)*l1)*s12**(-1)*
     & denb**(-1) * (  - za(p2,p9)*za(p7,a7)*zb(p1,p4)*zb(p10,a7)*mt**2
     &     + za(p2,q4)*za(p7,a7)*za(p9,b1)*zb(p1,b1)*zb(p4,q4)*zb(p10,
     &    a7) )
      mqbq(1,2) = mqbq(1,2) + (Q(j)*q1+propz*R(j)*l1)*s12**(-1)*
     & denu**(-1) * ( za(p2,p7)*za(p9,u1)*zb(p1,u1)*zb(p4,p10)*mt**2 -
     &    za(p2,p9)*za(p7,a7)*zb(p1,a7)*zb(p4,p10)*mt**2 )
      mqbq(1,2) = mqbq(1,2) + (Q(j)*q1+propz*R(j)*l1)*s12**(-1)*
     & denb**(-1) * (  - za(p2,q4)*za(p7,p9)*zb(p1,p10)*zb(p4,q4)*mt**2
     &     + za(p2,b2)*za(p7,p9)*zb(p1,p4)*zb(p10,b2)*mt**2 )

      mqbq(1,2)=mqbq(1,2) + (Q(j12)*q1+propz*R(j12)*l1)*s12z**(-1)*
     & denz1**(-1) * (  - za(p1,p9)*za(p2,p7)*zb(p1,p4)*zb(p1,p10)*
     &    mt**2 + za(p1,p9)*za(p2,q4)*za(p7,a7)*zb(p1,p10)*zb(p1,a7)*
     &    zb(p4,q4) - za(p2,p7)*za(p9,p10)*zb(p1,p10)*zb(p4,p10)*mt**2
     &     - za(p2,q4)*za(p7,a7)*za(p9,p10)*zb(p1,p10)*zb(p4,q4)*zb(p10
     &    ,a7) )
      mqbq(1,2) = mqbq(1,2) + (Q(j12)*q1+propz*R(j12)*l1)*s12z**(-1)*
     & denz2**(-1) * ( za(p2,p7)*za(p2,p9)*zb(p1,p4)*zb(p2,p10)*mt**2
     &     - za(p2,p9)*za(p2,q4)*za(p7,a7)*zb(p1,a7)*zb(p2,p10)*zb(p4,
     &    q4) - za(p2,p9)*za(p7,p9)*zb(p1,p4)*zb(p9,p10)*mt**2 - za(p2,
     &    p9)*za(p7,a7)*za(p9,q4)*zb(p1,a7)*zb(p4,q4)*zb(p9,p10) )

      mqbq(2,2)= + (Q(j)*q1+propz*R(j)*r1)*s12**(-1)*denu**(-1) * ( za(
     &    p2,p7)*za(p10,u1)*zb(p1,u1)*zb(p4,p9)*mt**2 - za(p2,p10)*za(
     &    p7,a7)*zb(p1,a7)*zb(p4,p9)*mt**2 )
      mqbq(2,2) = mqbq(2,2) + (Q(j)*q1+propz*R(j)*r1)*s12**(-1)*
     & denb**(-1) * (  - za(p2,q4)*za(p7,p10)*zb(p1,p9)*zb(p4,q4)*mt**2
     &     + za(p2,b2)*za(p7,p10)*zb(p1,p4)*zb(p9,b2)*mt**2 )
      mqbq(2,2) = mqbq(2,2) + (Q(j)*q1+propz*L(j)*r1)*s12**(-1)*
     & denu**(-1) * (  - za(p2,p7)*za(p10,q4)*zb(p1,p9)*zb(p4,q4)*mt**2
     &     + za(p2,u2)*za(p7,a7)*za(p10,q4)*zb(p1,a7)*zb(p4,q4)*zb(p9,
     &    u2) )
      mqbq(2,2) = mqbq(2,2) + (Q(j)*q1+propz*L(j)*r1)*s12**(-1)*
     & denb**(-1) * (  - za(p2,p10)*za(p7,a7)*zb(p1,p4)*zb(p9,a7)*mt**2
     &     + za(p2,q4)*za(p7,a7)*za(p10,b1)*zb(p1,b1)*zb(p4,q4)*zb(p9,
     &    a7) )

      mqbq(2,2)=mqbq(2,2) + (Q(j12)*q1+propz*R(j12)*r1)*s12z**(-1)*
     & denz1**(-1) * (  - za(p1,p10)*za(p2,p7)*zb(p1,p4)*zb(p1,p9)*
     &    mt**2 + za(p1,p10)*za(p2,q4)*za(p7,a7)*zb(p1,p9)*zb(p1,a7)*
     &    zb(p4,q4) + za(p2,p7)*za(p9,p10)*zb(p1,p9)*zb(p4,p9)*mt**2 +
     &    za(p2,q4)*za(p7,a7)*za(p9,p10)*zb(p1,p9)*zb(p4,q4)*zb(p9,a7)
     &     )
      mqbq(2,2) = mqbq(2,2) + (Q(j12)*q1+propz*R(j12)*r1)*s12z**(-1)*
     & denz2**(-1) * ( za(p2,p7)*za(p2,p10)*zb(p1,p4)*zb(p2,p9)*mt**2
     &     - za(p2,p10)*za(p2,q4)*za(p7,a7)*zb(p1,a7)*zb(p2,p9)*zb(p4,
     &    q4) + za(p2,p10)*za(p7,p10)*zb(p1,p4)*zb(p9,p10)*mt**2 + za(
     &    p2,p10)*za(p7,a7)*za(p10,q4)*zb(p1,a7)*zb(p4,q4)*zb(p9,p10) )


      mqqb(1,1)= + (Q(j)*q1+propz*L(j)*l1)*s12**(-1)*denu**(-1) * (  -
     &    za(p2,p7)*za(p9,q4)*zb(p1,p10)*zb(p4,q4)*mt**2 + za(p2,u2)*
     &    za(p7,a7)*za(p9,q4)*zb(p1,a7)*zb(p4,q4)*zb(p10,u2) )
      mqqb(1,1) = mqqb(1,1) + (Q(j)*q1+propz*L(j)*l1)*s12**(-1)*
     & denb**(-1) * (  - za(p2,p9)*za(p7,a7)*zb(p1,p4)*zb(p10,a7)*mt**2
     &     + za(p2,q4)*za(p7,a7)*za(p9,b1)*zb(p1,b1)*zb(p4,q4)*zb(p10,
     &    a7) )
      mqqb(1,1) = mqqb(1,1) + (Q(j)*q1+propz*R(j)*l1)*s12**(-1)*
     & denu**(-1) * ( za(p2,p7)*za(p9,u1)*zb(p1,u1)*zb(p4,p10)*mt**2 -
     &    za(p2,p9)*za(p7,a7)*zb(p1,a7)*zb(p4,p10)*mt**2 )
      mqqb(1,1) = mqqb(1,1) + (Q(j)*q1+propz*R(j)*l1)*s12**(-1)*
     & denb**(-1) * (  - za(p2,q4)*za(p7,p9)*zb(p1,p10)*zb(p4,q4)*mt**2
     &     + za(p2,b2)*za(p7,p9)*zb(p1,p4)*zb(p10,b2)*mt**2 )

      mqqb(1,1)=mqqb(1,1) + (Q(j12)*q1+propz*L(j12)*l1)*s12z**(-1)*
     & denz1**(-1) * ( za(p1,p9)*za(p2,p7)*zb(p1,p4)*zb(p1,p10)*mt**2
     &     - za(p1,p9)*za(p2,q4)*za(p7,a7)*zb(p1,p10)*zb(p1,a7)*zb(p4,
     &    q4) + za(p2,p7)*za(p9,p10)*zb(p1,p10)*zb(p4,p10)*mt**2 + za(
     &    p2,q4)*za(p7,a7)*za(p9,p10)*zb(p1,p10)*zb(p4,q4)*zb(p10,a7) )
      mqqb(1,1) = mqqb(1,1) + (Q(j12)*q1+propz*L(j12)*l1)*s12z**(-1)*
     & denz2**(-1) * (  - za(p2,p7)*za(p2,p9)*zb(p1,p4)*zb(p2,p10)*
     &    mt**2 + za(p2,p9)*za(p2,q4)*za(p7,a7)*zb(p1,a7)*zb(p2,p10)*
     &    zb(p4,q4) + za(p2,p9)*za(p7,p9)*zb(p1,p4)*zb(p9,p10)*mt**2 +
     &    za(p2,p9)*za(p7,a7)*za(p9,q4)*zb(p1,a7)*zb(p4,q4)*zb(p9,p10)
     &     )

      mqqb(2,1)= + (Q(j)*q1+propz*R(j)*r1)*s12**(-1)*denu**(-1) * ( za(
     &    p2,p7)*za(p10,u1)*zb(p1,u1)*zb(p4,p9)*mt**2 - za(p2,p10)*za(
     &    p7,a7)*zb(p1,a7)*zb(p4,p9)*mt**2 )
      mqqb(2,1) = mqqb(2,1) + (Q(j)*q1+propz*R(j)*r1)*s12**(-1)*
     & denb**(-1) * (  - za(p2,q4)*za(p7,p10)*zb(p1,p9)*zb(p4,q4)*mt**2
     &     + za(p2,b2)*za(p7,p10)*zb(p1,p4)*zb(p9,b2)*mt**2 )
      mqqb(2,1) = mqqb(2,1) + (Q(j)*q1+propz*L(j)*r1)*s12**(-1)*
     & denu**(-1) * (  - za(p2,p7)*za(p10,q4)*zb(p1,p9)*zb(p4,q4)*mt**2
     &     + za(p2,u2)*za(p7,a7)*za(p10,q4)*zb(p1,a7)*zb(p4,q4)*zb(p9,
     &    u2) )
      mqqb(2,1) = mqqb(2,1) + (Q(j)*q1+propz*L(j)*r1)*s12**(-1)*
     & denb**(-1) * (  - za(p2,p10)*za(p7,a7)*zb(p1,p4)*zb(p9,a7)*mt**2
     &     + za(p2,q4)*za(p7,a7)*za(p10,b1)*zb(p1,b1)*zb(p4,q4)*zb(p9,
     &    a7) )

      mqqb(2,1)=mqqb(2,1) + (Q(j12)*q1+propz*L(j12)*r1)*s12z**(-1)*
     & denz1**(-1) * ( za(p1,p10)*za(p2,p7)*zb(p1,p4)*zb(p1,p9)*mt**2
     &     - za(p1,p10)*za(p2,q4)*za(p7,a7)*zb(p1,p9)*zb(p1,a7)*zb(p4,
     &    q4) - za(p2,p7)*za(p9,p10)*zb(p1,p9)*zb(p4,p9)*mt**2 - za(p2,
     &    q4)*za(p7,a7)*za(p9,p10)*zb(p1,p9)*zb(p4,q4)*zb(p9,a7) )
      mqqb(2,1) = mqqb(2,1) + (Q(j12)*q1+propz*L(j12)*r1)*s12z**(-1)*
     & denz2**(-1) * (  - za(p2,p7)*za(p2,p10)*zb(p1,p4)*zb(p2,p9)*
     &    mt**2 + za(p2,p10)*za(p2,q4)*za(p7,a7)*zb(p1,a7)*zb(p2,p9)*
     &    zb(p4,q4) - za(p2,p10)*za(p7,p10)*zb(p1,p4)*zb(p9,p10)*mt**2
     &     - za(p2,p10)*za(p7,a7)*za(p10,q4)*zb(p1,a7)*zb(p4,q4)*zb(p9,
     &    p10) )

      mqqb(1,2)= + (Q(j)*q1+propz*L(j)*l1)*s12**(-1)*denu**(-1) * (  -
     &    za(p1,p7)*za(p9,q4)*zb(p2,p10)*zb(p4,q4)*mt**2 + za(p1,u1)*
     &    za(p7,a7)*za(p9,q4)*zb(p2,a7)*zb(p4,q4)*zb(p10,u1) )
      mqqb(1,2) = mqqb(1,2) + (Q(j)*q1+propz*L(j)*l1)*s12**(-1)*
     & denb**(-1) * (  - za(p1,p9)*za(p7,a7)*zb(p2,p4)*zb(p10,a7)*mt**2
     &     + za(p1,q4)*za(p7,a7)*za(p9,b2)*zb(p2,b2)*zb(p4,q4)*zb(p10,
     &    a7) )
      mqqb(1,2) = mqqb(1,2) + (Q(j)*q1+propz*R(j)*l1)*s12**(-1)*
     & denu**(-1) * ( za(p1,p7)*za(p9,u2)*zb(p2,u2)*zb(p4,p10)*mt**2 -
     &    za(p1,p9)*za(p7,a7)*zb(p2,a7)*zb(p4,p10)*mt**2 )
      mqqb(1,2) = mqqb(1,2) + (Q(j)*q1+propz*R(j)*l1)*s12**(-1)*
     & denb**(-1) * (  - za(p1,q4)*za(p7,p9)*zb(p2,p10)*zb(p4,q4)*mt**2
     &     + za(p1,b1)*za(p7,p9)*zb(p2,p4)*zb(p10,b1)*mt**2 )

      mqqb(1,2)=mqqb(1,2) + (Q(j12)*q1+propz*R(j12)*l1)*s12z**(-1)*
     & denz1**(-1) * ( za(p1,p7)*za(p1,p9)*zb(p1,p10)*zb(p2,p4)*mt**2
     &     - za(p1,p9)*za(p1,q4)*za(p7,a7)*zb(p1,p10)*zb(p2,a7)*zb(p4,
     &    q4) - za(p1,p9)*za(p7,p9)*zb(p2,p4)*zb(p9,p10)*mt**2 - za(p1,
     &    p9)*za(p7,a7)*za(p9,q4)*zb(p2,a7)*zb(p4,q4)*zb(p9,p10) )
      mqqb(1,2) = mqqb(1,2) + (Q(j12)*q1+propz*R(j12)*l1)*s12z**(-1)*
     & denz2**(-1) * (  - za(p1,p7)*za(p2,p9)*zb(p2,p4)*zb(p2,p10)*
     &    mt**2 - za(p1,p7)*za(p9,p10)*zb(p2,p10)*zb(p4,p10)*mt**2 +
     &    za(p1,q4)*za(p2,p9)*za(p7,a7)*zb(p2,p10)*zb(p2,a7)*zb(p4,q4)
     &     - za(p1,q4)*za(p7,a7)*za(p9,p10)*zb(p2,p10)*zb(p4,q4)*zb(p10
     &    ,a7) )

      mqqb(2,2)= + (Q(j)*q1+propz*R(j)*r1)*s12**(-1)*denu**(-1) * ( za(
     &    p1,p7)*za(p10,u2)*zb(p2,u2)*zb(p4,p9)*mt**2 - za(p1,p10)*za(
     &    p7,a7)*zb(p2,a7)*zb(p4,p9)*mt**2 )
      mqqb(2,2) = mqqb(2,2) + (Q(j)*q1+propz*R(j)*r1)*s12**(-1)*
     & denb**(-1) * (  - za(p1,q4)*za(p7,p10)*zb(p2,p9)*zb(p4,q4)*mt**2
     &     + za(p1,b1)*za(p7,p10)*zb(p2,p4)*zb(p9,b1)*mt**2 )
      mqqb(2,2) = mqqb(2,2) + (Q(j)*q1+propz*L(j)*r1)*s12**(-1)*
     & denu**(-1) * (  - za(p1,p7)*za(p10,q4)*zb(p2,p9)*zb(p4,q4)*mt**2
     &     + za(p1,u1)*za(p7,a7)*za(p10,q4)*zb(p2,a7)*zb(p4,q4)*zb(p9,
     &    u1) )
      mqqb(2,2) = mqqb(2,2) + (Q(j)*q1+propz*L(j)*r1)*s12**(-1)*
     & denb**(-1) * (  - za(p1,p10)*za(p7,a7)*zb(p2,p4)*zb(p9,a7)*mt**2
     &     + za(p1,q4)*za(p7,a7)*za(p10,b2)*zb(p2,b2)*zb(p4,q4)*zb(p9,
     &    a7) )

      mqqb(2,2)=mqqb(2,2) + (Q(j12)*q1+propz*R(j12)*r1)*s12z**(-1)*
     & denz1**(-1) * ( za(p1,p7)*za(p1,p10)*zb(p1,p9)*zb(p2,p4)*mt**2
     &     - za(p1,p10)*za(p1,q4)*za(p7,a7)*zb(p1,p9)*zb(p2,a7)*zb(p4,
     &    q4) + za(p1,p10)*za(p7,p10)*zb(p2,p4)*zb(p9,p10)*mt**2 + za(
     &    p1,p10)*za(p7,a7)*za(p10,q4)*zb(p2,a7)*zb(p4,q4)*zb(p9,p10) )
      mqqb(2,2) = mqqb(2,2) + (Q(j12)*q1+propz*R(j12)*r1)*s12z**(-1)*
     & denz2**(-1) * (  - za(p1,p7)*za(p2,p10)*zb(p2,p4)*zb(p2,p9)*
     &    mt**2 + za(p1,p7)*za(p9,p10)*zb(p2,p9)*zb(p4,p9)*mt**2 + za(
     &    p1,q4)*za(p2,p10)*za(p7,a7)*zb(p2,p9)*zb(p2,a7)*zb(p4,q4) +
     &    za(p1,q4)*za(p7,a7)*za(p9,p10)*zb(p2,p9)*zb(p4,q4)*zb(p9,a7)
     &     )


      do h1=1,2
      do h2=1,2
      wtqqb(j12)=wtqqb(j12)+cdabs(mqqb(h1,h2))**2
      wtqbq(j12)=wtqbq(j12)+cdabs(mqbq(h1,h2))**2
      enddo
      enddo
      enddo
      return
      end
