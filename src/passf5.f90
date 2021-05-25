
    subroutine passf5_sp (ido, l1, cc, ch, wa1, wa2, wa3, wa4)
        use fftpack_kinds, only: sp
        implicit real(sp) (a - h, o - z)
        dimension cc(ido, 5, l1), ch(ido, l1, 5), &
            wa1(*), wa2(*), wa3(*), wa4(*)
!     *** tr11=cos(2*pi/5), ti11=-sin(2*pi/5)
!     *** tr12=-cos(4*pi/5), ti12=-sin(4*pi/5)
        data tr11, ti11, tr12, ti12/0.3090169943749474241d0, &
            -0.95105651629515357212d0, &
            -0.8090169943749474241d0, -0.58778525229247312917d0/
        if (ido .ne. 2) go to 102
        do k = 1, l1
            ti5 = cc(2, 2, k) - cc(2, 5, k)
            ti2 = cc(2, 2, k) + cc(2, 5, k)
            ti4 = cc(2, 3, k) - cc(2, 4, k)
            ti3 = cc(2, 3, k) + cc(2, 4, k)
            tr5 = cc(1, 2, k) - cc(1, 5, k)
            tr2 = cc(1, 2, k) + cc(1, 5, k)
            tr4 = cc(1, 3, k) - cc(1, 4, k)
            tr3 = cc(1, 3, k) + cc(1, 4, k)
            ch(1, k, 1) = cc(1, 1, k) + tr2 + tr3
            ch(2, k, 1) = cc(2, 1, k) + ti2 + ti3
            cr2 = cc(1, 1, k) + tr11*tr2 + tr12*tr3
            ci2 = cc(2, 1, k) + tr11*ti2 + tr12*ti3
            cr3 = cc(1, 1, k) + tr12*tr2 + tr11*tr3
            ci3 = cc(2, 1, k) + tr12*ti2 + tr11*ti3
            cr5 = ti11*tr5 + ti12*tr4
            ci5 = ti11*ti5 + ti12*ti4
            cr4 = ti12*tr5 - ti11*tr4
            ci4 = ti12*ti5 - ti11*ti4
            ch(1, k, 2) = cr2 - ci5
            ch(1, k, 5) = cr2 + ci5
            ch(2, k, 2) = ci2 + cr5
            ch(2, k, 3) = ci3 + cr4
            ch(1, k, 3) = cr3 - ci4
            ch(1, k, 4) = cr3 + ci4
            ch(2, k, 4) = ci3 - cr4
            ch(2, k, 5) = ci2 - cr5
        end do
        return
102     do k = 1, l1
            do i = 2, ido, 2
                ti5 = cc(i, 2, k) - cc(i, 5, k)
                ti2 = cc(i, 2, k) + cc(i, 5, k)
                ti4 = cc(i, 3, k) - cc(i, 4, k)
                ti3 = cc(i, 3, k) + cc(i, 4, k)
                tr5 = cc(i - 1, 2, k) - cc(i - 1, 5, k)
                tr2 = cc(i - 1, 2, k) + cc(i - 1, 5, k)
                tr4 = cc(i - 1, 3, k) - cc(i - 1, 4, k)
                tr3 = cc(i - 1, 3, k) + cc(i - 1, 4, k)
                ch(i - 1, k, 1) = cc(i - 1, 1, k) + tr2 + tr3
                ch(i, k, 1) = cc(i, 1, k) + ti2 + ti3
                cr2 = cc(i - 1, 1, k) + tr11*tr2 + tr12*tr3
                ci2 = cc(i, 1, k) + tr11*ti2 + tr12*ti3
                cr3 = cc(i - 1, 1, k) + tr12*tr2 + tr11*tr3
                ci3 = cc(i, 1, k) + tr12*ti2 + tr11*ti3
                cr5 = ti11*tr5 + ti12*tr4
                ci5 = ti11*ti5 + ti12*ti4
                cr4 = ti12*tr5 - ti11*tr4
                ci4 = ti12*ti5 - ti11*ti4
                dr3 = cr3 - ci4
                dr4 = cr3 + ci4
                di3 = ci3 + cr4
                di4 = ci3 - cr4
                dr5 = cr2 + ci5
                dr2 = cr2 - ci5
                di5 = ci2 - cr5
                di2 = ci2 + cr5
                ch(i - 1, k, 2) = wa1(i - 1)*dr2 + wa1(i)*di2
                ch(i, k, 2) = wa1(i - 1)*di2 - wa1(i)*dr2
                ch(i - 1, k, 3) = wa2(i - 1)*dr3 + wa2(i)*di3
                ch(i, k, 3) = wa2(i - 1)*di3 - wa2(i)*dr3
                ch(i - 1, k, 4) = wa3(i - 1)*dr4 + wa3(i)*di4
                ch(i, k, 4) = wa3(i - 1)*di4 - wa3(i)*dr4
                ch(i - 1, k, 5) = wa4(i - 1)*dr5 + wa4(i)*di5
                ch(i, k, 5) = wa4(i - 1)*di5 - wa4(i)*dr5
            end do
        end do
        return
    end subroutine

    subroutine passf5_dp (ido, l1, cc, ch, wa1, wa2, wa3, wa4)
        use fftpack_kinds, only: dp
        implicit real(dp) (a - h, o - z)
        dimension cc(ido, 5, l1), ch(ido, l1, 5), &
            wa1(*), wa2(*), wa3(*), wa4(*)
!     *** tr11=cos(2*pi/5), ti11=-sin(2*pi/5)
!     *** tr12=-cos(4*pi/5), ti12=-sin(4*pi/5)
        data tr11, ti11, tr12, ti12/0.3090169943749474241d0, &
            -0.95105651629515357212d0, &
            -0.8090169943749474241d0, -0.58778525229247312917d0/
        if (ido .ne. 2) go to 102
        do k = 1, l1
            ti5 = cc(2, 2, k) - cc(2, 5, k)
            ti2 = cc(2, 2, k) + cc(2, 5, k)
            ti4 = cc(2, 3, k) - cc(2, 4, k)
            ti3 = cc(2, 3, k) + cc(2, 4, k)
            tr5 = cc(1, 2, k) - cc(1, 5, k)
            tr2 = cc(1, 2, k) + cc(1, 5, k)
            tr4 = cc(1, 3, k) - cc(1, 4, k)
            tr3 = cc(1, 3, k) + cc(1, 4, k)
            ch(1, k, 1) = cc(1, 1, k) + tr2 + tr3
            ch(2, k, 1) = cc(2, 1, k) + ti2 + ti3
            cr2 = cc(1, 1, k) + tr11*tr2 + tr12*tr3
            ci2 = cc(2, 1, k) + tr11*ti2 + tr12*ti3
            cr3 = cc(1, 1, k) + tr12*tr2 + tr11*tr3
            ci3 = cc(2, 1, k) + tr12*ti2 + tr11*ti3
            cr5 = ti11*tr5 + ti12*tr4
            ci5 = ti11*ti5 + ti12*ti4
            cr4 = ti12*tr5 - ti11*tr4
            ci4 = ti12*ti5 - ti11*ti4
            ch(1, k, 2) = cr2 - ci5
            ch(1, k, 5) = cr2 + ci5
            ch(2, k, 2) = ci2 + cr5
            ch(2, k, 3) = ci3 + cr4
            ch(1, k, 3) = cr3 - ci4
            ch(1, k, 4) = cr3 + ci4
            ch(2, k, 4) = ci3 - cr4
            ch(2, k, 5) = ci2 - cr5
        end do
        return
102     do k = 1, l1
            do i = 2, ido, 2
                ti5 = cc(i, 2, k) - cc(i, 5, k)
                ti2 = cc(i, 2, k) + cc(i, 5, k)
                ti4 = cc(i, 3, k) - cc(i, 4, k)
                ti3 = cc(i, 3, k) + cc(i, 4, k)
                tr5 = cc(i - 1, 2, k) - cc(i - 1, 5, k)
                tr2 = cc(i - 1, 2, k) + cc(i - 1, 5, k)
                tr4 = cc(i - 1, 3, k) - cc(i - 1, 4, k)
                tr3 = cc(i - 1, 3, k) + cc(i - 1, 4, k)
                ch(i - 1, k, 1) = cc(i - 1, 1, k) + tr2 + tr3
                ch(i, k, 1) = cc(i, 1, k) + ti2 + ti3
                cr2 = cc(i - 1, 1, k) + tr11*tr2 + tr12*tr3
                ci2 = cc(i, 1, k) + tr11*ti2 + tr12*ti3
                cr3 = cc(i - 1, 1, k) + tr12*tr2 + tr11*tr3
                ci3 = cc(i, 1, k) + tr12*ti2 + tr11*ti3
                cr5 = ti11*tr5 + ti12*tr4
                ci5 = ti11*ti5 + ti12*ti4
                cr4 = ti12*tr5 - ti11*tr4
                ci4 = ti12*ti5 - ti11*ti4
                dr3 = cr3 - ci4
                dr4 = cr3 + ci4
                di3 = ci3 + cr4
                di4 = ci3 - cr4
                dr5 = cr2 + ci5
                dr2 = cr2 - ci5
                di5 = ci2 - cr5
                di2 = ci2 + cr5
                ch(i - 1, k, 2) = wa1(i - 1)*dr2 + wa1(i)*di2
                ch(i, k, 2) = wa1(i - 1)*di2 - wa1(i)*dr2
                ch(i - 1, k, 3) = wa2(i - 1)*dr3 + wa2(i)*di3
                ch(i, k, 3) = wa2(i - 1)*di3 - wa2(i)*dr3
                ch(i - 1, k, 4) = wa3(i - 1)*dr4 + wa3(i)*di4
                ch(i, k, 4) = wa3(i - 1)*di4 - wa3(i)*dr4
                ch(i - 1, k, 5) = wa4(i - 1)*dr5 + wa4(i)*di5
                ch(i, k, 5) = wa4(i - 1)*di5 - wa4(i)*dr5
            end do
        end do
        return
    end subroutine

    subroutine passf5_qp (ido, l1, cc, ch, wa1, wa2, wa3, wa4)
        use fftpack_kinds, only: qp
        implicit real(qp) (a - h, o - z)
        dimension cc(ido, 5, l1), ch(ido, l1, 5), &
            wa1(*), wa2(*), wa3(*), wa4(*)
!     *** tr11=cos(2*pi/5), ti11=-sin(2*pi/5)
!     *** tr12=-cos(4*pi/5), ti12=-sin(4*pi/5)
        data tr11, ti11, tr12, ti12/0.3090169943749474241d0, &
            -0.95105651629515357212d0, &
            -0.8090169943749474241d0, -0.58778525229247312917d0/
        if (ido .ne. 2) go to 102
        do k = 1, l1
            ti5 = cc(2, 2, k) - cc(2, 5, k)
            ti2 = cc(2, 2, k) + cc(2, 5, k)
            ti4 = cc(2, 3, k) - cc(2, 4, k)
            ti3 = cc(2, 3, k) + cc(2, 4, k)
            tr5 = cc(1, 2, k) - cc(1, 5, k)
            tr2 = cc(1, 2, k) + cc(1, 5, k)
            tr4 = cc(1, 3, k) - cc(1, 4, k)
            tr3 = cc(1, 3, k) + cc(1, 4, k)
            ch(1, k, 1) = cc(1, 1, k) + tr2 + tr3
            ch(2, k, 1) = cc(2, 1, k) + ti2 + ti3
            cr2 = cc(1, 1, k) + tr11*tr2 + tr12*tr3
            ci2 = cc(2, 1, k) + tr11*ti2 + tr12*ti3
            cr3 = cc(1, 1, k) + tr12*tr2 + tr11*tr3
            ci3 = cc(2, 1, k) + tr12*ti2 + tr11*ti3
            cr5 = ti11*tr5 + ti12*tr4
            ci5 = ti11*ti5 + ti12*ti4
            cr4 = ti12*tr5 - ti11*tr4
            ci4 = ti12*ti5 - ti11*ti4
            ch(1, k, 2) = cr2 - ci5
            ch(1, k, 5) = cr2 + ci5
            ch(2, k, 2) = ci2 + cr5
            ch(2, k, 3) = ci3 + cr4
            ch(1, k, 3) = cr3 - ci4
            ch(1, k, 4) = cr3 + ci4
            ch(2, k, 4) = ci3 - cr4
            ch(2, k, 5) = ci2 - cr5
        end do
        return
102     do k = 1, l1
            do i = 2, ido, 2
                ti5 = cc(i, 2, k) - cc(i, 5, k)
                ti2 = cc(i, 2, k) + cc(i, 5, k)
                ti4 = cc(i, 3, k) - cc(i, 4, k)
                ti3 = cc(i, 3, k) + cc(i, 4, k)
                tr5 = cc(i - 1, 2, k) - cc(i - 1, 5, k)
                tr2 = cc(i - 1, 2, k) + cc(i - 1, 5, k)
                tr4 = cc(i - 1, 3, k) - cc(i - 1, 4, k)
                tr3 = cc(i - 1, 3, k) + cc(i - 1, 4, k)
                ch(i - 1, k, 1) = cc(i - 1, 1, k) + tr2 + tr3
                ch(i, k, 1) = cc(i, 1, k) + ti2 + ti3
                cr2 = cc(i - 1, 1, k) + tr11*tr2 + tr12*tr3
                ci2 = cc(i, 1, k) + tr11*ti2 + tr12*ti3
                cr3 = cc(i - 1, 1, k) + tr12*tr2 + tr11*tr3
                ci3 = cc(i, 1, k) + tr12*ti2 + tr11*ti3
                cr5 = ti11*tr5 + ti12*tr4
                ci5 = ti11*ti5 + ti12*ti4
                cr4 = ti12*tr5 - ti11*tr4
                ci4 = ti12*ti5 - ti11*ti4
                dr3 = cr3 - ci4
                dr4 = cr3 + ci4
                di3 = ci3 + cr4
                di4 = ci3 - cr4
                dr5 = cr2 + ci5
                dr2 = cr2 - ci5
                di5 = ci2 - cr5
                di2 = ci2 + cr5
                ch(i - 1, k, 2) = wa1(i - 1)*dr2 + wa1(i)*di2
                ch(i, k, 2) = wa1(i - 1)*di2 - wa1(i)*dr2
                ch(i - 1, k, 3) = wa2(i - 1)*dr3 + wa2(i)*di3
                ch(i, k, 3) = wa2(i - 1)*di3 - wa2(i)*dr3
                ch(i - 1, k, 4) = wa3(i - 1)*dr4 + wa3(i)*di4
                ch(i, k, 4) = wa3(i - 1)*di4 - wa3(i)*dr4
                ch(i - 1, k, 5) = wa4(i - 1)*dr5 + wa4(i)*di5
                ch(i, k, 5) = wa4(i - 1)*di5 - wa4(i)*dr5
            end do
        end do
        return
    end subroutine

