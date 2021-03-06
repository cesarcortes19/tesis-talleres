package com.cursos.model;

import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Cesar on 20/09/2014.
 */
@Entity
@Table(name = "pagos")
@DynamicUpdate
public class PagosModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_usuario", nullable = true)
    private UserModel userModel;
    @Column(name = "modo_pago", nullable = true)
    private ModoPago modoPago;
    @Column(name = "tipo_pago", nullable = true)
    private TipoPago tipoPago;
    @Column(name = "numero_comprobante", nullable = true)
    private String numeroComprobante;
    @Column(name = "meses_pagos", nullable = true)
    private int mesesPagos;
    @Column(name = "monto_ingresado", nullable = true)
    private double montoIngresado;
    @Column(name = "monto_calculado_por_aplicacion", nullable = true)
    private double montoCalculado;
    @Column(name = "status_transaccion", nullable = true)
    private StatusType status;
    @Column(name = "log_transacion", nullable = true)
    private String logTransaccion;
    @Column(name = "fecha_pago", nullable = true)
    private Timestamp fechaPago;
    @OneToMany(fetch = FetchType.EAGER,  cascade = CascadeType.ALL, mappedBy = "pagosModel")
    private Set<DetallePagoModel> detallePagoModels = new HashSet<DetallePagoModel>();

    public enum ModoPago {TRANSFERENCIA, DEPOSITO, EFECTIVO}
    public enum StatusType {REALIZADO_POR_REPRESENTANTE, PAGO_APROBADO_ADMINISTRADOR, PAGO_RECHAZADO}
    public enum TipoPago {MENSUALIDAD, INSCRIPCION}


    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

    public ModoPago getModoPago() {
        return modoPago;
    }

    public void setModoPago(ModoPago modoPago) {
        this.modoPago = modoPago;
    }

    public TipoPago getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(TipoPago tipoPago) {
        this.tipoPago = tipoPago;
    }

    public String getNumeroComprobante() {
        return numeroComprobante;
    }

    public void setNumeroComprobante(String numeroComprobante) {
        this.numeroComprobante = numeroComprobante;
    }

    public int getMesesPagos() {
        return mesesPagos;
    }

    public void setMesesPagos(int mesesPagos) {
        this.mesesPagos = mesesPagos;
    }

    public double getMontoIngresado() {
        return montoIngresado;
    }

    public void setMontoIngresado(double montoIngresado) {
        this.montoIngresado = montoIngresado;
    }

    public double getMontoCalculado() {
        return montoCalculado;
    }

    public void setMontoCalculado(double montoCalculado) {
        this.montoCalculado = montoCalculado;
    }

    public String getLogTransaccion() {
        return logTransaccion;
    }

    public void setLogTransaccion(String logTransaccion) {
        this.logTransaccion = logTransaccion;
    }

    public StatusType getStatus() {
        return status;
    }

    public void setStatus(StatusType status) {
        this.status = status;
    }

    public Timestamp getFechaPago() {
        return fechaPago;
    }

    public void setFechaPago(Timestamp fechaPago) {
        this.fechaPago = fechaPago;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Set<DetallePagoModel> getDetallePagoModels() {
        return detallePagoModels;
    }

    public void setDetallePagoModels(Set<DetallePagoModel> detallePagoModels) {
        this.detallePagoModels = detallePagoModels;
    }
}
