

select * from nap_qlik_orders where dzien between '2020-12-01' and '2020-12-02'


create or replace view nap_qlik_orders as
select kk.kierunek_kosztow_kod kierunek_kosztow, sz.d_obr dzien, round(sum(szp.ilosc)/3,3) ilosc_posilkow
                    from grupy_zywionych gz, stany_zywionych sz, Stany_zywionych_posilki szp, s_kierunki_kosztow kk
                    where sz.id_grupa_zywionych = gz.id_grupa_zywionych
                    and szp.id_stan_zywionych = sz.id_stan_zywionych
                    and kk.id_kierunek_kosztow = gz.id_kierunek_kosztow
                    and to_char(sz.d_obr,'YYYY') > 2018
                    --and to_char(sz.d_obr,'YYYY-MM-DD') between '2020-12-01' and '2020-12-02'
                    and szp.id_posilek in (1,3,5)      
group by kk.kierunek_kosztow_kod, sz.d_obr

 
                    
                    
                    
                    
