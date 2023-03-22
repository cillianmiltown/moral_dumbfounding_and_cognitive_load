library(TOSTER)

d <- .205

TOSTER::powerTOSTpaired(.05,.8, low_eqbound_dz = -d, high_eqbound_dz = d)



equivalence_means_test <- function(k1,k2,d){
  TOSTtwo(m1=mean(k1), m2=mean(k2),
          sd1=sd(k1), sd2=sd(k2),
          n1=length(k1), n2=length(k2),
          low_eqbound_d=-d, high_eqbound_d=d, alpha = 0.05)
}


x <- df3

x$reason_given <- dplyr::recode(x$InCS,
                                "There is nothing wrong."=0
                                ,"It's wrong but I can't think of a reason."=0
                                ,"It's wrong and I can provide a valid reason."=1
)

x <- x[which(x$scenario=="Incest"),]

g1 <- x$reason_given[which(x$condition=="cog_load")]
g2 <- x$reason_given[which(x$condition=="control")]



equivalence_means_test(g1,g2,d)


table(x$reason_given,x$condition)
chisq.test(table(x$reason_given,x$condition))
