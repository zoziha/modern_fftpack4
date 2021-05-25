
    subroutine radf5_sp (ido, l1, cc, ch, wa1, wa2, wa3, wa4)
        use fftpack_kinds, only: sp
        implicit real(sp) (a - h, o - z)
        dimension cc(ido, l1, 5), ch(ido, 5, l1), &
            wa1(*), wa2(*), wa3(*), wa4(*)
        data tr11, ti11, tr12, ti12/0.3090169943749474241d0, &
            0.95105651629515357212d0, &
            -0.8090169943749474241d0, 0.58778525229247312917d0/
        do k = 1, l1
            cr2 = cc(1, k, 5) + cc(1, k, 2)
            ci5 = cc(1, k, 5) - cc(1, k, 2)
            cr3 = cc(1, k, 4) + cc(1, k, 3)
            ci4 = cc(1, k, 4) - cc(1, k, 3)
            ch(1, 1, k) = cc(1, k, 1) + cr2 + cr3
            ch(ido, 2, k) = cc(1, k, 1) + tr11*cr2 + tr12*cr3
            ch(1, 3, k) = ti11*ci5 + ti12*ci4
            ch(ido, 4, k) = cc(1, k, 1) + tr12*cr2 + tr11*cr3
            ch(1, 5, k) = ti12*ci5 - ti11*ci4
        end do
        if (ido .eq. 1) return
        idp2 = ido + 2
        do k = 1, l1
            do i = 3, ido, 2
                ic = idp2 - i
                dr2 = wa1(i - 2)*cc(i - 1, k, 2) + wa1(i - 1)*cc(i, k, 2)
                di2 = wa1(i - 2)*cc(i, k, 2) - wa1(i - 1)*cc(i - 1, k, 2)
                dr3 = wa2(i - 2)*cc(i - 1, k, 3) + wa2(i - 1)*cc(i, k, 3)
                di3 = wa2(i - 2)*cc(i, k, 3) - wa2(i - 1)*cc(i - 1, k, 3)
                dr4 = wa3(i - 2)*cc(i - 1, k, 4) + wa3(i - 1)*cc(i, k, 4)
                di4 = wa3(i - 2)*cc(i, k, 4) - wa3(i - 1)*cc(i - 1, k, 4)
                dr5 = wa4(i - 2)*cc(i - 1, k, 5) + wa4(i - 1)*cc(i, k, 5)
                di5 = wa4(i - 2)*cc(i, k, 5) - wa4(i - 1)*cc(i - 1, k, 5)
                cr2 = dr2 + dr5
                ci5 = dr5 - dr2
                cr5 = di2 - di5
                ci2 = di2 + di5
                cr3 = dr3 + dr4
                ci4 = dr4 - dr3
                cr4 = di3 - di4
                ci3 = di3 + di4
                ch(i - 1, 1, k) = cc(i - 1, k, 1) + cr2 + cr3
                ch(i, 1, k) = cc(i, k, 1) + ci2 + ci3
                tr2 = cc(i - 1, k, 1) + tr11*cr2 + tr12*cr3
                ti2 = cc(i, k, 1) + tr11*ci2 + tr12*ci3
                tr3 = cc(i - 1, k, 1) + tr12*cr2 + tr11*cr3
                ti3 = cc(i, k, 1) + tr12*ci2 + tr11*ci3
                tr5 = ti11*cr5 + ti12*cr4
                ti5 = ti11*ci5 + ti12*ci4
                tr4 = ti12*cr5 - ti11*cr4
                ti4 = ti12*ci5 - ti11*ci4
                ch(i - 1, 3, k) = tr2 + tr5
                ch(ic - 1, 2, k) = tr2 - tr5
                ch(i, 3, k) = ti2 + ti5
                ch(ic, 2, k) = ti5 - ti2
                ch(i - 1, 5, k) = tr3 + tr4
                ch(ic - 1, 4, k) = tr3 - tr4
                ch(i, 5, k) = ti3 + ti4
                ch(ic, 4, k) = ti4 - ti3
            end do
        end do
        return
    end subroutine

    subroutine radf5_dp (ido, l1, cc, ch, wa1, wa2, wa3, wa4)
        use fftpack_kinds, only: dp
        implicit real(dp) (a - h, o - z)
        dimension cc(ido, l1, 5), ch(ido, 5, l1), &
            wa1(*), wa2(*), wa3(*), wa4(*)
        data tr11, ti11, tr12, ti12/0.3090169943749474241d0, &
            0.95105651629515357212d0, &
            -0.8090169943749474241d0, 0.58778525229247312917d0/
        do k = 1, l1
            cr2 = cc(1, k, 5) + cc(1, k, 2)
            ci5 = cc(1, k, 5) - cc(1, k, 2)
            cr3 = cc(1, k, 4) + cc(1, k, 3)
            ci4 = cc(1, k, 4) - cc(1, k, 3)
            ch(1, 1, k) = cc(1, k, 1) + cr2 + cr3
            ch(ido, 2, k) = cc(1, k, 1) + tr11*cr2 + tr12*cr3
            ch(1, 3, k) = ti11*ci5 + ti12*ci4
            ch(ido, 4, k) = cc(1, k, 1) + tr12*cr2 + tr11*cr3
            ch(1, 5, k) = ti12*ci5 - ti11*ci4
        end do
        if (ido .eq. 1) return
        idp2 = ido + 2
        do k = 1, l1
            do i = 3, ido, 2
                ic = idp2 - i
                dr2 = wa1(i - 2)*cc(i - 1, k, 2) + wa1(i - 1)*cc(i, k, 2)
                di2 = wa1(i - 2)*cc(i, k, 2) - wa1(i - 1)*cc(i - 1, k, 2)
                dr3 = wa2(i - 2)*cc(i - 1, k, 3) + wa2(i - 1)*cc(i, k, 3)
                di3 = wa2(i - 2)*cc(i, k, 3) - wa2(i - 1)*cc(i - 1, k, 3)
                dr4 = wa3(i - 2)*cc(i - 1, k, 4) + wa3(i - 1)*cc(i, k, 4)
                di4 = wa3(i - 2)*cc(i, k, 4) - wa3(i - 1)*cc(i - 1, k, 4)
                dr5 = wa4(i - 2)*cc(i - 1, k, 5) + wa4(i - 1)*cc(i, k, 5)
                di5 = wa4(i - 2)*cc(i, k, 5) - wa4(i - 1)*cc(i - 1, k, 5)
                cr2 = dr2 + dr5
                ci5 = dr5 - dr2
                cr5 = di2 - di5
                ci2 = di2 + di5
                cr3 = dr3 + dr4
                ci4 = dr4 - dr3
                cr4 = di3 - di4
                ci3 = di3 + di4
                ch(i - 1, 1, k) = cc(i - 1, k, 1) + cr2 + cr3
                ch(i, 1, k) = cc(i, k, 1) + ci2 + ci3
                tr2 = cc(i - 1, k, 1) + tr11*cr2 + tr12*cr3
                ti2 = cc(i, k, 1) + tr11*ci2 + tr12*ci3
                tr3 = cc(i - 1, k, 1) + tr12*cr2 + tr11*cr3
                ti3 = cc(i, k, 1) + tr12*ci2 + tr11*ci3
                tr5 = ti11*cr5 + ti12*cr4
                ti5 = ti11*ci5 + ti12*ci4
                tr4 = ti12*cr5 - ti11*cr4
                ti4 = ti12*ci5 - ti11*ci4
                ch(i - 1, 3, k) = tr2 + tr5
                ch(ic - 1, 2, k) = tr2 - tr5
                ch(i, 3, k) = ti2 + ti5
                ch(ic, 2, k) = ti5 - ti2
                ch(i - 1, 5, k) = tr3 + tr4
                ch(ic - 1, 4, k) = tr3 - tr4
                ch(i, 5, k) = ti3 + ti4
                ch(ic, 4, k) = ti4 - ti3
            end do
        end do
        return
    end subroutine

    subroutine radf5_qp (ido, l1, cc, ch, wa1, wa2, wa3, wa4)
        use fftpack_kinds, only: qp
        implicit real(qp) (a - h, o - z)
        dimension cc(ido, l1, 5), ch(ido, 5, l1), &
            wa1(*), wa2(*), wa3(*), wa4(*)
        data tr11, ti11, tr12, ti12/0.3090169943749474241d0, &
            0.95105651629515357212d0, &
            -0.8090169943749474241d0, 0.58778525229247312917d0/
        do k = 1, l1
            cr2 = cc(1, k, 5) + cc(1, k, 2)
            ci5 = cc(1, k, 5) - cc(1, k, 2)
            cr3 = cc(1, k, 4) + cc(1, k, 3)
            ci4 = cc(1, k, 4) - cc(1, k, 3)
            ch(1, 1, k) = cc(1, k, 1) + cr2 + cr3
            ch(ido, 2, k) = cc(1, k, 1) + tr11*cr2 + tr12*cr3
            ch(1, 3, k) = ti11*ci5 + ti12*ci4
            ch(ido, 4, k) = cc(1, k, 1) + tr12*cr2 + tr11*cr3
            ch(1, 5, k) = ti12*ci5 - ti11*ci4
        end do
        if (ido .eq. 1) return
        idp2 = ido + 2
        do k = 1, l1
            do i = 3, ido, 2
                ic = idp2 - i
                dr2 = wa1(i - 2)*cc(i - 1, k, 2) + wa1(i - 1)*cc(i, k, 2)
                di2 = wa1(i - 2)*cc(i, k, 2) - wa1(i - 1)*cc(i - 1, k, 2)
                dr3 = wa2(i - 2)*cc(i - 1, k, 3) + wa2(i - 1)*cc(i, k, 3)
                di3 = wa2(i - 2)*cc(i, k, 3) - wa2(i - 1)*cc(i - 1, k, 3)
                dr4 = wa3(i - 2)*cc(i - 1, k, 4) + wa3(i - 1)*cc(i, k, 4)
                di4 = wa3(i - 2)*cc(i, k, 4) - wa3(i - 1)*cc(i - 1, k, 4)
                dr5 = wa4(i - 2)*cc(i - 1, k, 5) + wa4(i - 1)*cc(i, k, 5)
                di5 = wa4(i - 2)*cc(i, k, 5) - wa4(i - 1)*cc(i - 1, k, 5)
                cr2 = dr2 + dr5
                ci5 = dr5 - dr2
                cr5 = di2 - di5
                ci2 = di2 + di5
                cr3 = dr3 + dr4
                ci4 = dr4 - dr3
                cr4 = di3 - di4
                ci3 = di3 + di4
                ch(i - 1, 1, k) = cc(i - 1, k, 1) + cr2 + cr3
                ch(i, 1, k) = cc(i, k, 1) + ci2 + ci3
                tr2 = cc(i - 1, k, 1) + tr11*cr2 + tr12*cr3
                ti2 = cc(i, k, 1) + tr11*ci2 + tr12*ci3
                tr3 = cc(i - 1, k, 1) + tr12*cr2 + tr11*cr3
                ti3 = cc(i, k, 1) + tr12*ci2 + tr11*ci3
                tr5 = ti11*cr5 + ti12*cr4
                ti5 = ti11*ci5 + ti12*ci4
                tr4 = ti12*cr5 - ti11*cr4
                ti4 = ti12*ci5 - ti11*ci4
                ch(i - 1, 3, k) = tr2 + tr5
                ch(ic - 1, 2, k) = tr2 - tr5
                ch(i, 3, k) = ti2 + ti5
                ch(ic, 2, k) = ti5 - ti2
                ch(i - 1, 5, k) = tr3 + tr4
                ch(ic - 1, 4, k) = tr3 - tr4
                ch(i, 5, k) = ti3 + ti4
                ch(ic, 4, k) = ti4 - ti3
            end do
        end do
        return
    end subroutine

